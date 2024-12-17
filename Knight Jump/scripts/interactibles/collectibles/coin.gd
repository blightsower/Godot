extends Area2D

@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	Events.on_coin_collect.emit(GameManager.update_score(1))
	animation_player.play("pickup")
