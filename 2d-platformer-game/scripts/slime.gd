extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var killzone: Area2D = $Killzone
@onready var killed_slime_sound: AudioStreamPlayer2D = $KilledSlimeSound
@onready var timer: Timer = $AttackZone/Timer

const SPEED = 60
var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	elif ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	
	position.x += delta * SPEED * direction


func _on_attack_zone_body_entered(body: Node2D) -> void:
	print("Killed slime!")
	killzone.queue_free()
	animated_sprite_2d.play("hurt")
	killed_slime_sound.playing = true
	await get_tree().create_timer(0.5).timeout
	queue_free()
	
