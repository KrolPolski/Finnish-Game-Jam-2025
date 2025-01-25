extends CharacterBody2D


const SPEED = 300.0
var move_dir
var is_floating

func _ready() -> void:
	move_dir = -1 #just a test
	is_floating = false

func _physics_process(delta: float) -> void:
	
	if !is_floating:
		velocity.x = move_dir * SPEED
	else:
		velocity.y = -1 * SPEED
#	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bubble"):
		position.x += move_dir * 10
		velocity.x = 0
		is_floating = true
		
