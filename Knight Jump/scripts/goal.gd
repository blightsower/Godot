extends Area2D

func _on_body_entered(body: Node2D):
	GameManager.next_stage()
	get_tree().change_scene_to_file("res://scenes/transition_screen.tscn")
