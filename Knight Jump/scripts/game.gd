extends Node2D

@onready var pause_menu: CanvasLayer = $PauseMenu

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		GameManager.pause()
		get_tree().paused = GameManager.get_pause_status()

func on_pause(val):
	if GameManager.get_pause_status():
		pause_menu.show()
	else:
		pause_menu.hide()

func _on_pause_menu_ready() -> void:
	GameManager.on_pause.connect(on_pause)
