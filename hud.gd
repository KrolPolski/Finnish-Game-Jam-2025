extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func start_game():
	get_tree().change_scene_to_file("res://world.tscn")

func on_start_button_pressed():
	$Message.text = "Send the creatures back through the portal!"
	$Message.show()
	
	# start_game.emit()

func _key_input(event):
	if event is InputEventKey and event.pressed and event.scancode == KEY_SPACE:
		start_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_score(1)

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
