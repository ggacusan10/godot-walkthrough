extends Area2D

@onready var picked_up_power_up_sound: AudioStreamPlayer2D = $PickedUpPowerUpSound

signal power_up_hitbox_hit

func _on_body_entered(body: Node2D) -> void:
	print("Collected powerup")
	picked_up_power_up_sound.playing = true
	power_up_hitbox_hit.emit()
