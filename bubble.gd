extends Area2D

const SPEED = 300
var spawn_pos : Vector2
var dir

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawn_pos
	dir = 0
	$'Timer'.start()
	$AnimatedSprite2D.play("bubble_sprite")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += dir * SPEED * delta
	
	if (position.y <= 30):
		queue_free()


func _on_timer_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		$'Timer'.stop()
		dir = -1
