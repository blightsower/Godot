extends Node

var _MAX_SCORE = 99

var score = 0
var life = 3

signal on_score_increased(score)
signal on_life_changed(life)

func increase_score(val):
	score += val
	print("+" + str(val) + " coin(s)")
	on_score_increased.emit(score)

func change_life(val):
	life += val
	print(str(life))
	on_life_changed.emit(life)
