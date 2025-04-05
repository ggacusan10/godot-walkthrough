extends AnimatedSprite2D

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var slime: AnimatedSprite2D = $"."
@onready var area_2d: Area2D = $Area2D
@onready var timer: Timer = $Area2D/Timer
@onready var killzone_collision_shape: CollisionShape2D = $Killzone/CollisionShape2D

const SPEED = 60

var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		slime.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		slime.flip_h = false
	
	position.x += direction * SPEED * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Killed slime!")
	killzone_collision_shape.queue_free()

	slime.play("die")
	await get_tree().create_timer(0.5).timeout
	queue_free()
