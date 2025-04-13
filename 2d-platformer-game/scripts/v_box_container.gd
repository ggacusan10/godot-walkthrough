extends VBoxContainer


func _ready() -> void:
	GameManager.game_over_signal.connect(_on_game_over_signal)
	
func _on_game_over_signal() -> void:
	self.visible = false
