extends Node

signal lives_changed(lives)
signal coins_changed(coins)
signal fruits_changed(fruits)
signal game_over_signal

# making it static so that the game_state persists
# across *scene reloads*. We don't want to create
# new instances of this object
static var game_state := GameState.new()

func _ready() -> void:
	print("[GameManager] ready game_state: ", game_state)
	if game_state == null:
		game_state = GameState.new()
		print("[GameManager] creating new game_state", game_state)

func decrement_life() -> void:
	print("[GameManager] decrement_life")
	game_state.lives -= 1
	
	if game_state.lives <= 0:
		emit_signal("game_over_signal")
		game_state.is_game_over = true
	else:
		emit_signal("lives_changed", game_state.lives)

func add_collected_coin(coin_id: String) -> void:
	game_state.collected_coins[coin_id] = true
	game_state.coins += 1
	emit_signal("coins_changed", game_state.coins)

func add_fruit() -> void:
	# TODO: need to map the fruits to avoid respawning
	#collected_fruits[fruit_id] = true
	game_state.fruits += 1
	emit_signal("fruits_changed", game_state.fruits)

func add_killed_slime(slime_id: String) -> void:
	game_state.killed_slimes[slime_id] = true
	game_state.slimes += 1

func reload() -> void:
	game_state = GameState.new()
	get_tree().reload_current_scene()
