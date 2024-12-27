extends CanvasLayer

@onready var life_label: Label = $LifeControl/LifeLabel
@onready var score_label: Label = $ScoreControl/ScoreLabel

func _on_ready() -> void:
	Events.on_player_life_changed.connect(on_life_changed)
	Events.on_coin_collect.connect(on_score_changed)
	
	life_label.text = "x" + str(GameManager.life)
	score_label.text = "x" + str(GameManager.score)
	
func on_life_changed(val:int):
	GameManager.life = GameManager.life + val
	life_label.text = "x" + str(GameManager.life)

func on_score_changed(val:int):
	GameManager.score = GameManager.score + val
	score_label.text = "x" + str(GameManager.score)

func on_pause_game():
	pass
	
func on_show_pause_menu():
	pass
	
func on_show_option_menu():
	pass
	
func on_show_input_menu():
	pass
