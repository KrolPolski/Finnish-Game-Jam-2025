extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter_key"):
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	if Input.is_action_just_pressed("Info"):
		get_tree().change_scene_to_file("res://scenes/instructions.tscn")

func update_score(score):
	$Score.text = str(score)
