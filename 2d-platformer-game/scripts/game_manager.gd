extends Node

@onready var scoreLabel: Label = $CanvasLayer/ScoreLabel

var coins = 0
var fruits = 0

func update_score_label_text():
	scoreLabel.text = "Coins: {coins}
	
	Fruits: {fruits}
	".format({"coins": coins, "fruits": fruits})
	print("[game_manager] scoreLabel.text: ", scoreLabel.text)

func add_point():
	coins += 1
	print("Current coins: ", coins)
	update_score_label_text()
	
func add_fruit_score():
	fruits += 1
	print("Current fruit count: ", fruits)
	update_score_label_text()
