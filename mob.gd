extends CharacterBody2D


var FLOAT_SPEED = -300
var is_floating = false

@export var speed: float = 150
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
	
	if !is_floating:
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
	else:
		move_and_slide()
		if (position.y <= 30):
			is_floating = false
			set_collision_mask_value(2, true)
			set_collision_mask_value(3, true)
			set_collision_mask_value(5, true)
			speed += 50
			
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bubble"):
		velocity.x = 0
		velocity.y = FLOAT_SPEED
		is_floating = true
		set_collision_mask_value(2, false)
		set_collision_mask_value(3, false)
		set_collision_mask_value(5, false)


func _on_door_area_body_entered(body: Node2D) -> void:
	# change scene to game over
	get_tree().paused = true
