extends Node

# player events
signal on_player_life_changed(new_value:int)
signal on_player_health_changed(new_value:int)
signal on_player_death()
signal on_player_spawn()

# stage events
signal on_game_start()
signal on_stage_finish()
signal on_stage_checkpoint()

# menu events
signal on_pause_game()
signal on_pause_menu()
signal on_input_menu()
signal on_option_menu()

# entity events
signal on_coin_collect(new_value:int)
signal on_monster_die()
