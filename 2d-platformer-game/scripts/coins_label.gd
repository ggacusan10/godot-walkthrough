extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Coins: " + str(GameManagerV2.coins)
	GameManagerV2.coins_changed.connect(_on_coins_changed)

func _on_coins_changed(coin: int):
	text = "Coins: " + str(coin)
