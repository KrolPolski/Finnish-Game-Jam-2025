extends CharacterBody2D

@export var speed: float = 200
var right: Vector2 = Vector2.RIGHT  # Start moving right
var left: Vector2 = Vector2.LEFT
var direction = right 
var framecount = 0
var collision_vector
var angle
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AnimatedSprite2D.play("enemy_sprite")
	
func _physics_process(delta: float):
	velocity = direction * speed
	if not is_on_floor():
		velocity += get_gravity() * delta * 10
	if move_and_slide():
	#direction += collision_vector
		if not is_on_floor_only():
			if direction == left:
				direction = right
				$AnimatedSprite2D.flip_h = true
			else:
				direction = left
				$AnimatedSprite2D.flip_h = false
	
	
