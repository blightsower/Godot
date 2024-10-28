extends CanvasLayer

@onready var transition_timer: Timer = $TransitionTimer
@onready var scene_label: Label = $PanelContainer/MarginContainer/Rows/SceneLabel

func _ready() -> void:
	scene_label.text = "Level " + str(GameManager.current_stage)
	transition_timer.start()

func _on_transition_timer_timeout() -> void:
	
	match GameManager.current_stage:
		1: get_tree().change_scene_to_file("res://scenes/game.tscn")
		2: get_tree().change_scene_to_file("res://scenes/game_2.tscn")
		3: get_tree().change_scene_to_file("res://scenes/game_3.tscn")
		4: get_tree().change_scene_to_file("res://scenes/game_4.tscn")
		5: get_tree().change_scene_to_file("res://scenes/game_5.tscn")
		6: print("Congratulations!!!")
	GameManager.current_stage = GameManager.current_stage + 1
