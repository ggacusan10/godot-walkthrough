extends Node

signal lives_changed(lives)
signal coins_changed(coins)
signal fruits_changed(fruits)
signal game_over_signal

const MAX_LIVES = 3

# Keeps track of which nodes were collected by the player
# to avoid respawning said nodes when the player respawns
var collected_coins = {}
var collected_fruits = {}
var killed_slimes = {}

# Keeps track of number of `item` collected
var coins = 0
var fruits = 0

var is_game_over = false

var lives: int = MAX_LIVES:
	set(new_lives):
		print("new lives: ", new_lives)
		if new_lives > 0:
			lives = new_lives
			print("[GameManager] setting new life: ", lives)
			emit_signal("lives_changed", lives)
		if new_lives == 0:
			print("[GameManager] Game Over!")
			is_game_over = true
			emit_signal("game_over_signal")
	get:
		return lives

func decrement_life() -> void:
	print("[GameManager] decrement_life")
	lives -= 1

func add_collected_coin(coin_id: String) -> void:
	collected_coins[coin_id] = true
	coins += 1
	emit_signal("coins_changed", coins)

func add_fruit() -> void:
	# TODO: need to map the fruits to avoid respawning
	#collected_fruits[fruit_id] = true
	fruits += 1
	emit_signal("fruits_changed", fruits)

func add_killed_slime(slime_id: String) -> void:
	killed_slimes[slime_id] = true

func reload() -> void:
	lives = MAX_LIVES
	collected_coins = {}
	collected_fruits = {}
	killed_slimes = {}
	coins = 0
	fruits = 0
	is_game_over = false
	get_tree().reload_current_scene()
