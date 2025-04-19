extends Node

signal lives_changed(lives)
signal coins_changed(coins)
signal fruits_changed(fruits)
signal slimes_changed(slimes)
signal game_over_signal

# making it static so that the game_state persists
# across *scene reloads*. We don't want to create
# new instances of this object
static var game_state := GameState.new()

func _ready() -> void:
	print("[GameManager] ready game_state: ", game_state)
	# We may have set the Engine to half speed on death, but
	# once we reload the game, we should set it back to normal
	Engine.time_scale = 1
	if game_state == null:
		game_state = GameState.new()
		print("[GameManager] creating new game_state: ", game_state)

func decrement_life() -> void:
	print("[GameManager] decrement_life")
	game_state.lives -= 1
	
	if game_state.lives <= 0:
		game_state.is_game_over = true
		game_state.did_win = false
		emit_signal("game_over_signal")
	else:
		emit_signal("lives_changed", game_state.lives)
		await get_tree().create_timer(0.5).timeout
		get_tree().reload_current_scene()

func add_collected_coin(coin_id: String) -> void:
	game_state.collected_coins[coin_id] = true
	game_state.coins += 1
	emit_signal("coins_changed", game_state.coins)

func add_fruit(fruit_id: String) -> void:
	game_state.collected_fruits[fruit_id] = true
	game_state.fruits += 1
	emit_signal("fruits_changed", game_state.fruits)

func add_killed_slime(slime_id: String) -> void:
	game_state.killed_slimes[slime_id] = true
	game_state.slimes += 1
	emit_signal("slimes_changed", game_state.slimes)

func game_won() -> void:
	game_state.is_game_over = true
	game_state.did_win = true
	emit_signal("game_over_signal")

func reload() -> void:
	game_state = GameState.new()
	get_tree().reload_current_scene()

func update_checkpoint(new_position: Vector2) -> void:
	game_state.last_checkpoint = new_position
