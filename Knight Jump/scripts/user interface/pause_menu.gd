extends CanvasLayer

@onready var resume: Button = $MarginContainer/VBoxContainer/Resume
@onready var resume_timer: Timer = $MarginContainer/ResumeTimer

var _is_clickable = false

func _ready() -> void:
	resume.grab_focus()

func _on_resume_pressed() -> void:
	if GameManager.get_pause_status() and _is_clickable:
		GameManager.pause()
		get_tree().paused = GameManager.get_pause_status()

func _on_visibility_changed() -> void:
	resume.grab_focus()
	resume_timer.start()
	_is_clickable = false

func _on_resume_timer_timeout() -> void:
	_is_clickable = true

func _on_options_pressed() -> void:
	GameManager.show_options(true)

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/user interface/menu.tscn")
	GameManager.pause()
	get_tree().paused = GameManager.get_pause_status()
