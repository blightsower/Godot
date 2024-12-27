extends Node

var INITIAL_SPAWNS = [ Vector2i(-39, 207) ]

const MAX_SCORE = 99
const MAX_STAGE = 5
const INITIAL_LIFE = 3
const INITIAL_SCORE = 0
const INITIAL_STAGE = 1

var score: int:
	set(value):
		score = value
	get:
		return score
	
var life : int :
	set(value):
		life = value
	get:
		return life

var is_paused :bool :
	set(value):
		is_paused = value
	get:
		return is_paused


func pause():
	is_paused = !is_paused
	#Events.on_pause_game.emit()


var _current_stage
var _campaign
var _spawn

#func get_pause_status():
	#return is_paused

func reset():
	life = INITIAL_LIFE
	score = INITIAL_SCORE
	_current_stage = INITIAL_STAGE
	_spawn = INITIAL_SPAWNS[0]
	is_paused = false
	SceneTransition.visible = true

func next_stage():
	_current_stage += 1
	if _current_stage > MAX_STAGE:
		SceneTransition.change_scene("res://scenes/user interface/menu.tscn", "Congratulations!!!")

func get_campaign_state():
	return _campaign

func get_current_stage():
	return _current_stage
	
func get_spawn():
	return _spawn
	
func set_spawn(v:Vector2i):
	_spawn = v
	
func load_scene():
	match GameManager.get_current_stage():
		1: SceneTransition.change_scene("res://scenes/stages/game.tscn", "Level 1")
		2: SceneTransition.change_scene("res://scenes/stages/game_2.tscn", "Level 2")
		3: SceneTransition.change_scene("res://scenes/stages/game_3.tscn", "Level 3")
		4: SceneTransition.change_scene("res://scenes/stages/game_4.tscn", "Level 4")
		5: SceneTransition.change_scene("res://scenes/stages/game_5.tscn", "Level 5")
		
func show_options(visibility:bool):
	InputSettings.visible = visibility
	
func show_pause_menu(visibility:bool):
	PauseMenu.visible = visibility
