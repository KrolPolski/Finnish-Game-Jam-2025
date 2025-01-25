extends CharacterBody2D

var SPEED = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float):
	position.x += SPEED
	if position.x >= 950:
		SPEED -=2
	if position.x <= 0:
		SPEED +=2
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
