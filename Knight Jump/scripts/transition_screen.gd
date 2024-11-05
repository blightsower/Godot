extends CanvasLayer

@onready var transition_timer: Timer = $TransitionTimer
@onready var scene_label: Label = $PanelContainer/MarginContainer/Rows/SceneLabel

func _ready():
	if GameManager.get_campaign_state() == GameManager.CAMPAIGN.DEFEAT:
		scene_label.text = "Game Over"
	elif GameManager.get_campaign_state() == GameManager.CAMPAIGN.VICTORY:
		scene_label.text = "Congratulations!!!"
	else:
		scene_label.text = "Level " + str(GameManager.get_current_stage())
	transition_timer.start()
	


#func _on_transition_timer_timeout() -> void:
	#if GameManager.get_campaign_state() == GameManager.CAMPAIGN.DEFEAT || GameManager.get_campaign_state() == GameManager.CAMPAIGN.VICTORY:
		#SceneTransition.change_scene("res://scenes/menu.tscn", "")
	#else:
		#_load_scene()
