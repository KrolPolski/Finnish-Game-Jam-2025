extends CharacterBody2D


const SPEED = 200.0
const CLIMB_VELOCITY = -200.0

var is_under_platform
var under_count
var is_over_platform
var over_count
var is_climbing_up
var is_climbing_down
var climb_dir

var bubble_preload = preload("res://scenes/bubble.tscn")
@onready var main = get_tree().get_root().get_node("Level 1")

func _ready() -> void:
	is_under_platform = false
	is_over_platform = false
	is_climbing_up = false
	is_climbing_down = false
	climb_dir = 0
	under_count = 0
	over_count = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("enter"):
		print("********")
		print("IS UNDER PLATFORM:")
		print(is_under_platform)
		print("IS OVER PLATFORM:")
		print(is_over_platform)
		print("IS CLIMBING UP:")
		print(is_climbing_up)
		print("IS CLIMBING DOWN:")
		print(is_climbing_down)
		print("********")

	# Handle climb.
	if Input.is_action_just_pressed("climb_up") and is_under_platform and !is_climbing_up and !is_climbing_down:
		is_climbing_up = true
		climb_dir = 1
	elif Input.is_action_just_pressed("climb_down") and is_over_platform and !is_climbing_up and !is_climbing_down:
		is_climbing_down = true
		climb_dir = -1

		
	if Input.is_action_just_pressed("drop_bubble") and !is_climbing_up and !is_climbing_down and is_on_floor():
		var instance = bubble_preload.instantiate()
		instance.spawn_pos.x = global_position.x
		instance.spawn_pos.y = global_position.y
		instance.add_to_group("bubble")
		main.add_child.call_deferred(instance)
		
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if !is_climbing_up and !is_climbing_down:
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
		under_count += 1
		print("UNDER PLATFORM")
	if area.is_in_group("over_platform"):
		is_over_platform = true
		over_count += 1
		print("OVER PLATFORM")


func _on_player_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("under_platform"):
		under_count -= 1
		if under_count <= 0:
			is_under_platform = false
		print("UNDER PLATFORM STOP")
		if is_climbing_up:
			velocity.y = 0
			is_climbing_up = false
			set_collision_mask_value(2, true)
	if area.is_in_group("over_platform"):
		print("OVER PLATFORM STOP")
		over_count -= 1
		if over_count <= 0:
			is_over_platform = false
		if is_climbing_down:
			velocity.y = 0
			is_climbing_down = false
			set_collision_mask_value(2, true)
