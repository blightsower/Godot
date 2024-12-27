extends Node2D

func _on_ready() -> void:
	Events.on_pause_game.connect(on_pause)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		print("check")
		GameManager.pause()
		Events.on_pause_game.emit()
		get_tree().paused = GameManager.is_paused

func on_pause():
	if GameManager.is_paused:
		PauseMenu.show()
	else:
		PauseMenu.hide()
