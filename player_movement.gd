extends CharacterBody2D


const SPEED = 400.0
const CLIMB_VELOCITY = -600.0
var is_under_platform
var is_over_platform
var is_climbing
var climb_dir

func _ready() -> void:
	is_under_platform = false
	is_over_platform = false
	is_climbing = false
	climb_dir = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle climb.
	if Input.is_action_just_pressed("climb_up") and is_under_platform and !is_climbing:
		is_climbing = true
		climb_dir = 1
	elif Input.is_action_just_pressed("climb_down") and is_over_platform and !is_climbing:
		is_climbing = true
		climb_dir = -1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if !is_climbing:
		var direction := Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		set_collision_mask_value(2, false)
		velocity.y = CLIMB_VELOCITY * climb_dir
		velocity.x = 0

	move_and_slide()


func _on_player_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("under_platform"):
		is_under_platform = true
		print("ENTERED UNDER")
	if area.is_in_group("over_platform"):
		is_over_platform = true
		print("ENTERED OVER")


func _on_player_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("under_platform"):
		is_under_platform = false
		print("EXITED UNDER")
		if is_climbing:
			velocity.y = 0
			is_climbing = false
			set_collision_mask_value(2, true)
	if area.is_in_group("over_platform"):
		is_over_platform = false
		print("EXITED OVER")
		if is_climbing:
			velocity.y = 0
			is_climbing = false
			set_collision_mask_value(2, true)
