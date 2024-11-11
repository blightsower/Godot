extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		GameManager.pause()
		get_tree().paused = GameManager.get_pause_status()

func on_pause():
	if GameManager.get_pause_status():
		PauseMenu.show()
	else:
		PauseMenu.hide()

func _on_ready() -> void:
	GameManager.on_pause.connect(on_pause)
