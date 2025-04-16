extends Node

@onready var label: Label = $Label

func _ready() -> void:
	label.visible = false

func _on_body_entered(body: Node2D) -> void:
	GameManager.update_checkpoint(self.position)
	label.visible = true
	await get_tree().create_timer(2.0).timeout
	label.visible = false
