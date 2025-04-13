extends Control

@onready var panel: Panel = $Panel/Control/Panel
@onready var game_outcome_label: Label = $Panel/Control/Panel/GameOutcomeLabel
@onready var coins_label: Label = $Panel/Control/Panel/VBoxContainer/CoinsLabel
@onready var fruits_label: Label = $Panel/Control/Panel/VBoxContainer/FruitsLabel
@onready var slimes_label: Label = $Panel/Control/Panel/VBoxContainer/SlimesLabel
@onready var button: Button = $Panel/Control/Panel/Button

class Style:
	var old: StyleBox = null
	var new: StyleBox = null

var panel_style = Style.new()
var button_style = Style.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_over_signal.connect(_on_game_over)	
	panel_style.old = panel.get_theme_stylebox("panel")
	panel_style.new = panel_style.old.duplicate()
	
	button_style.old = button.get_theme_stylebox("normal")
	button_style.new = button_style.old.duplicate()
	
	# remove them so we can override the style
	panel.remove_theme_stylebox_override("panel")
	button.remove_theme_color_override("normal")
	
func handle_game_win_styles() -> void:	
	game_outcome_label.text = "You win!"
	panel_style.new.bg_color = Color(0.33, 0.69, 0.33)
	button_style.new.bg_color = Color(0.14, 0.30, 0.15)
	
func handle_game_lose_styles() -> void:	
	game_outcome_label.text = "Game over!"
	panel_style.new.bg_color = Color(0.89, 0.38, 0.38)
	button_style.new.bg_color = Color(0.33, 0.69, 0.33)

func _on_game_over() -> void:
	print("[GameOver] received game over signal")
	self.visible = true
	
	if GameManager.game_state.did_win:
		handle_game_win_styles()
	else:
		handle_game_lose_styles()

	panel.add_theme_stylebox_override("panel", panel_style.new)
	button.add_theme_stylebox_override("normal", button_style.new)
	
	coins_label.text = "Coins collected: " + str(GameManager.game_state.coins)
	fruits_label.text = "Fruits collected: " + str(GameManager.game_state.fruits)
	slimes_label.text = "Slimes killed: " + str(GameManager.game_state.slimes)

func _on_button_pressed() -> void:
	GameManager.reload()
