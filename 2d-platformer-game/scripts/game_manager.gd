extends Node

@onready var score_label: Label = $ScoreLabel

var score = 0

func add_point():
	score += 1
	print("Current score: ", score)
	score_label.text = "Score: " + str(score)
	
func _on_grabbed_fruit() -> void:
	add_point()
