extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var killzone_collision_shape: CollisionShape2D = $Killzone/CollisionShape2D
@onready var killed_slime_sound: AudioStreamPlayer2D = $KilledSlimeSound
@onready var timer: Timer = $AttackZone/Timer

const SPEED: int = 60
var direction: int = 1
var slime_id: String

func _ready() -> void:
	slime_id = self.name
	# don't show the slime if it has been killed before
	if GameManager.game_state.killed_slimes.has(slime_id):
		queue_free()
	
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
	killzone_collision_shape.queue_free()
	animated_sprite_2d.play("hurt")
	killed_slime_sound.playing = true
	GameManager.add_killed_slime(slime_id)
	await get_tree().create_timer(0.5).timeout
	queue_free()
	
