extends CanvasLayer

@onready var life_label: Label = $LifeControl/LifeLabel
@onready var score_label: Label = $ScoreControl/ScoreLabel

func _on_ready() -> void:
	GameManager.on_life_changed.connect(on_life_changed)
	GameManager.on_score_increased.connect(on_score_changed)
	life_label.text = "x" + str(GameManager.life)
	
func on_life_changed(val):
	life_label.text = "x" + str(val)

func on_score_changed(val):
	score_label.text = "x" + str(val)
