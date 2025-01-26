extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_score(get_parent().get_node("Portal2").score)

func update_score(score):
	$ScoreLable/ScoreCounter.text = str(score)

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
