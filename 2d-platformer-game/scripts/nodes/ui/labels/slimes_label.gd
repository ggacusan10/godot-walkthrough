extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Slimes: " + str(GameManager.game_state.slimes)
	GameManager.slimes_changed.connect(_on_slimes_changed)

func _on_slimes_changed(slimes: int) -> void:
	text = "Slimes: " + str(slimes)
