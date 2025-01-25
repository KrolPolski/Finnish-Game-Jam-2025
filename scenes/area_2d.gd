extends Area2D

var SPEED = 2

@export var mob_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MobTimer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	if mob_scene:
		var mob = mob_scene.instantiate()
		get_parent().add_child(mob)  # Add mob to the scene
		mob.global_position.x = global_position.x + 25 # Spawn at Area2D's position
		mob.global_position.y = global_position.y - 150
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float):
	position.x += SPEED
	if position.x >= 400:
		SPEED -=2
	if position.x <= 0:
		SPEED +=2
