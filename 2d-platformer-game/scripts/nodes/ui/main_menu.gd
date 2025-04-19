extends Control

@onready var how_to_play_panel: Panel = $HowToPlayPanel

func _ready() -> void:
	how_to_play_panel.z_index = 0
	how_to_play_panel.visible = false

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	

func _on_how_to_play_button_pressed() -> void:
	how_to_play_panel.z_index = 1
	how_to_play_panel.visible = true

func _on_back_button_pressed() -> void:
	how_to_play_panel.z_index = 0
	how_to_play_panel.visible = false

func _on_exit_button_pressed() -> void:
	get_tree().quit()
