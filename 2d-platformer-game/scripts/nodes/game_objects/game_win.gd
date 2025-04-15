extends Area2D


func _on_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(0.5).timeout
	GameManager.game_won()
