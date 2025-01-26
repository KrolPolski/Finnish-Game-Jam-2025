extends CanvasLayer

var time = 0.0
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Died_message.hide()
	time += delta
	update_score(get_parent().get_node("Portal2").score)
	update_health(get_parent().get_node("Player").health)
	update_timer(time)
	if get_parent().get_node("Player").health <= 0:
			get_tree().paused = true
			$Died_message.show()
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://scenes/end_scene.tscn")

func update_score(score):
	$ScoreLable/ScoreCounter.text = str(score)

func update_health(health):
	$TimerLable/Health/HealthCounter.text = str(health)

func update_timer(time):
	var formatted_time = "%0.1f" % time
	$TimerLable/TimerCounter.text = str(formatted_time)

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

# Game over
func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	
	$Message.text = "Try again!"
	$Message.show()
	await get_tree().create_timer(3.0).timeout
	# Go back to title screen
