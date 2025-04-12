extends Node2D

@onready var fruit: Node2D = $Fruit
@onready var power_up_hitbox: Area2D = $PowerUpHitbox

func _ready():
	var powerUpHitbox = $PowerUpHitbox
	powerUpHitbox.power_up_hitbox_hit.connect(_on_power_up_hitbox_hit)
	fruit.grabbed_fruit.connect(_on_grabbed_fruit)

func _on_power_up_hitbox_hit() -> void:
	print("[mystery_powerup.gd] Received signal that it was hit")
	fruit.get_fruit()

func _on_grabbed_fruit() -> void:
	print("[mystery_powerup.gd] Grabbed fruit")
	GameManagerV2.add_fruit()
