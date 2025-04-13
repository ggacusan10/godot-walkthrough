extends Control

@onready var coins_label: Label = $Panel/Control/Panel/VBoxContainer/CoinsLabel
@onready var fruits_label: Label = $Panel/Control/Panel/VBoxContainer/FruitsLabel
@onready var slimes_label: Label = $Panel/Control/Panel/VBoxContainer/SlimesLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_over_signal.connect(_on_game_over)
	
func _on_game_over() -> void:
	print("[GameOver] received game over signal")
	self.visible = true
	coins_label.text = "Coins collected: " + str(GameManager.coins)
	fruits_label.text = "Fruits collected: " + str(GameManager.fruits)
	slimes_label.text = "Slimes killed: " + str(GameManager.slimes)
	

func _on_button_pressed() -> void:
	GameManager.reload()
