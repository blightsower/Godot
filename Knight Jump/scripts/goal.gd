extends Area2D

func _on_body_entered(body: Node2D):
	GameManager.next_stage()
	GameManager.load_scene()
	set_deferred("monitoring", false)
	print("ping")
