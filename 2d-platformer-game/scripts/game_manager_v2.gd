extends Node

signal lives_changed(lives)

var lives: int = 3:
	set(new_lives):
		if new_lives > 0:
			lives = new_lives
			print("[GameManagerV2] setting new life: ", lives)
			emit_signal("lives_changed", lives)
		else:
			print("[GameManagerV2] Game Over!")
	get:
		return lives

func decrement_life():
	print("[GameManagerV2] decrement_life")
	lives -= 1
