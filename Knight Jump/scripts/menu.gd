extends Control

@onready var btn_start: Button = $VBoxContainer/btn_start

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	btn_start.grab_focus()

func _on_btn_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_btn_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/input_settings.tscn")

func _on_btn_quit_pressed() -> void:
	get_tree().quit()
