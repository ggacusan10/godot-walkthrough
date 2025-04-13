extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Fruits: " + str(GameManager.game_state.fruits)
	GameManager.fruits_changed.connect(_on_fruits_changed)
	
func _on_fruits_changed(fruits: int) -> void:
	text = "Fruits: " + str(fruits)
