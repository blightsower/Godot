extends Control

@onready var btn_start: Button = $VBoxContainer/btn_start

func _ready() -> void:
	GameManager.show_options(false)
	SceneTransition.visible = false
	btn_start.grab_focus()

func _on_btn_start_pressed() -> void:
	GameManager.reset()
	GameManager.load_scene()

func _on_btn_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/user interface/input_settings.tscn")

func _on_btn_quit_pressed() -> void:
	get_tree().quit()
