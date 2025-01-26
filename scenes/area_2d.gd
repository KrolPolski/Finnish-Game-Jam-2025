extends Area2D


@export var mob_scene: PackedScene
@export var score = 0
# Called when the node enters the scene tree for the first time.
var SPEED = 1
var canSpawn = true
var mob_kill_list = null
func _ready() -> void:
	$MobTimer.timeout.connect(_on_timer_timeout)
	$PortalTimer.timeout.connect(_on_Portal_timer_timeout)
	$OrangeTimer.timeout.connect(_on_Orange_timer_timeout)
	$PortalTimer.start()

func _on_timer_timeout():
	if mob_scene and canSpawn:
		var mob = mob_scene.instantiate()
		get_parent().add_child(mob)  # Add mob to the scene
		mob.global_position.x = global_position.x # Spawn at Area2D's position
		mob.global_position.y = global_position.y
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_Portal_timer_timeout():
	canSpawn = false
	$OrangeTimer.start()
	
func _on_Orange_timer_timeout():
	canSpawn = true
	if ($MobTimer.wait_time > 0.1):
		$MobTimer.wait_time -= 0.1
	$PortalTimer.wait_time += 0.5
	$PortalTimer.start()
	
func _process(delta: float) -> void:
	if canSpawn:
		$AnimatedSprite2D.play("portal_sprite")
	else:
		$AnimatedSprite2D.play("portal_sprite_orange")
	
func _physics_process(delta: float):
	position.x += SPEED
	if position.x >= 870:
		SPEED -=1
	if position.x <= 420:
		SPEED +=1
	if !canSpawn:
		mob_kill_list = self.get_overlapping_bodies()
	if (mob_kill_list):
		for mob in mob_kill_list:
			if mob.is_in_group("mob"):
				mob.queue_free()
				score += 100
				$"../Sound_Effects/portal_score".play()
		mob_kill_list = null
#func _on_area_entered(area: Area2D) -> void:
	#print(area.name)
	#if !canSpawn and area.is_in_group("mob"):
		#print("Time to destroy a mob")
		#area.queue_free()
