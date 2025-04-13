extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_over_signal.connect(_on_game_over)
	
func _on_game_over() -> void:
	print("[GameOver] received game over signal")
	self.visible = true

func _on_button_pressed() -> void:
	GameManager.reload()
