extends Area2D

@onready var timer: Timer = $Timer
@onready var killed_sound: AudioStreamPlayer2D = $KilledSound


func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	# Engine goes half speed once we die
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	killed_sound.playing = true
	GameManager.decrement_life()	
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	killed_sound.playing = false
	
	if not GameManager.game_state.is_game_over:
		get_tree().reload_current_scene()
