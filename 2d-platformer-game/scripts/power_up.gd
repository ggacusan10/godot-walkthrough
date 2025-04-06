extends Area2D

@onready var picked_up_power_up_sound: AudioStreamPlayer2D = $PickedUpPowerUpSound

signal power_up_hitbox_hit

func _on_body_entered(body: Node2D) -> void:
	print("[power_up.gd] Collected powerup")
	picked_up_power_up_sound.playing = true
	power_up_hitbox_hit.emit()

	# once it's hit, remove the hitbox so that
	# the player get unlimited powerups from the
	# same hitbox
	await get_tree().create_timer(0.5).timeout
	queue_free()
