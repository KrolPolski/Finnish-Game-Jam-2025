extends Area2D

const SPEED = 300
var spawn_pos : Vector2
var dir

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawn_pos
	dir = 0
	$'Timer'.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += dir * SPEED * delta
	
	if (position.y <= 30):
		queue_free()
#		get_parent().get_node("Player").bubble_count -= 1


func _on_timer_timeout() -> void:
	queue_free()
#	get_parent().get_node("Player").bubble_count -= 1


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		$'Timer'.stop()
		dir = -1
