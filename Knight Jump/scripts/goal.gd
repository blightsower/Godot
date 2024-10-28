extends Area2D

func _on_body_entered(body: Node2D):
	GameManager.current_stage = GameManager.current_stage + 1
	get_tree().change_scene_to_file("res://scenes/transition_screen.tscn")
