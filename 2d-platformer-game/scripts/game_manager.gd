extends Node

@onready var scoreLabel: Label = $CanvasLayer/ScoreLabel

var score = 0

func add_point():
	score += 1
	print("Current score: ", score)
	scoreLabel.text = "Score: " + str(score)
	
func _on_grabbed_fruit() -> void:
	add_point()
