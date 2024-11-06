extends Node

var INITIAL_SPAWNS = [ Vector2i(-39, 207) ]

const MAX_SCORE = 99
const MAX_STAGE = 5

const INITIAL_LIFE = 3
const INITIAL_SCORE = 0
const INITIAL_STAGE = 1

var _score
var _life
var _current_stage
var _campaign
var _spawn
var _is_paused

signal on_score_increased(score)
signal on_life_changed(life)
signal on_pause()

func increase_score(val):
	_score += val
	on_score_increased.emit(_score)

func change_life(val):
	_life += val
	on_life_changed.emit(_life)
	if _life <= 0:
		SceneTransition.change_scene("res://scenes/menu.tscn", "Game Over!")
	else:
		load_scene()

func reset():
	_life = INITIAL_LIFE
	_score = INITIAL_SCORE
	_current_stage = INITIAL_STAGE
	_spawn = INITIAL_SPAWNS[0]
	_is_paused = false
	SceneTransition.visible = true

func _on_ready() -> void:
	on_life_changed.emit(_life)

func next_stage():
	_current_stage += 1
	if _current_stage > MAX_STAGE:
		SceneTransition.change_scene("res://scenes/menu.tscn", "Congratulations!!!")

func get_life():
	return _life

func get_score():
	return _score

func get_campaign_state():
	return _campaign

func get_current_stage():
	return _current_stage
	
func get_spawn():
	return _spawn
	
func set_spawn(v:Vector2i):
	_spawn = v

func pause():
	_is_paused = !_is_paused
	on_pause.emit()

func get_pause_status():
	return _is_paused
	
func load_scene():
	match GameManager.get_current_stage():
		1: SceneTransition.change_scene("res://scenes/stages/game.tscn", "Level 1")
		2: SceneTransition.change_scene("res://scenes/stages/game_2.tscn", "Level 2")
		3: SceneTransition.change_scene("res://scenes/stages/game_3.tscn", "Level 3")
		4: SceneTransition.change_scene("res://scenes/stages/game_4.tscn", "Level 4")
		5: SceneTransition.change_scene("res://scenes/stages/game_5.tscn", "Level 5")
