extends Node

enum CAMPAIGN { VICTORY, DEFEAT, PLAYING }
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
		_campaign = CAMPAIGN.DEFEAT

func reset():
	_life = INITIAL_LIFE
	_score = INITIAL_SCORE
	_current_stage = INITIAL_STAGE
	_campaign = CAMPAIGN.PLAYING
	_spawn = INITIAL_SPAWNS[0]
	_is_paused = false
	SceneTransition.visible = true

func _on_ready() -> void:
	on_life_changed.emit(_life)

func next_stage():
	_current_stage += 1
	if _current_stage > MAX_STAGE:
		_campaign = CAMPAIGN.VICTORY

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
