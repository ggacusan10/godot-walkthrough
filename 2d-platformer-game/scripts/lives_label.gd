extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Lives: " + str(GameManager.lives)
	GameManager.lives_changed.connect(_on_lives_changed)

func _on_lives_changed(lives):
	text = "Lives: " + str(GameManager.lives)
