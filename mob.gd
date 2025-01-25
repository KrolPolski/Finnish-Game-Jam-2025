extends CharacterBody2D

var SPEED = 2
var FLOAT_SPEED = -300
var dir = 1
var is_floating = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float):
	
	if !is_floating:
		position.x += SPEED * dir
		if position.x >= 450:
			dir = -1
		if position.x <= 0:
			dir = 1
		if not is_on_floor():
			velocity += get_gravity() * delta
	else:
		velocity.x = 0
		velocity.y = FLOAT_SPEED
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bubble"):
		velocity.x = 0
		velocity.y = FLOAT_SPEED
		is_floating = true
		set_collision_mask_value(4, false)
