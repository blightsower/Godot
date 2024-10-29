extends Area2D

@export var spawn_point: Node2D

func _on_body_entered(body):
	GameManager.set_spawn(spawn_point.position + position)
