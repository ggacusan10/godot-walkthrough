extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var coin_id: String

func _ready() -> void:
	if GameManagerV2.collected_coins.has(self.name):
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	GameManagerV2.add_collected_coin(self.name)
	animation_player.play("pickup")
