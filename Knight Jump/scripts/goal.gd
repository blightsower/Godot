extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print("move to next stage")
	print(str(GameManager.current_stage))
	if GameManager.current_stage == 1:
		GameManager.current_stage = GameManager.current_stage + 1
		get_tree().change_scene_to_file("res://scenes/game_2.tscn")
