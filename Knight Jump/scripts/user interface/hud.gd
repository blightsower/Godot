extends CanvasLayer

@onready var life_label: Label = $LifeControl/LifeLabel
@onready var score_label: Label = $ScoreControl/ScoreLabel

func _on_ready() -> void:
	Events.on_player_life_changed.connect(on_life_changed)
	Events.on_coin_collect.connect(on_score_changed)
	
	life_label.text = "x" + str(GameManager.life)
	score_label.text = "x" + str(GameManager.score)
	
func on_life_changed(val:int):
	life_label.text = "x" + str(val)

func on_score_changed(val:int):
	score_label.text = "x" + str(val)
