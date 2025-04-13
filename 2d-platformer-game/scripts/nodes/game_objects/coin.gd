extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var coin_id: String

func _ready() -> void:
	if GameManager.game_state.collected_coins.has(self.name):
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	GameManager.add_collected_coin(self.name)
	animation_player.play("pickup")
