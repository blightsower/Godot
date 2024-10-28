extends Node

var _MAX_SCORE = 99
var _score = 0
var life = 3
var current_stage = 1

signal on_score_increased(score)
signal on_life_changed(life)

func increase_score(val):
	_score += val
	print("+" + str(val) + " coin(s)")
	on_score_increased.emit(_score)

func change_life(val):
	life += val
	on_life_changed.emit(life)

func _on_ready() -> void:
	on_life_changed.emit(life)
