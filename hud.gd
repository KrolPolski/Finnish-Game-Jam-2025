extends CanvasLayer

var time = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	update_score(get_parent().get_node("Portal2").score)
	update_health(get_parent().get_node("Player").health)
	update_timer(time)

func update_score(score):
	$ScoreLable/ScoreCounter.text = str(score)

func update_health(health):
	$Health.text = str(health)

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
