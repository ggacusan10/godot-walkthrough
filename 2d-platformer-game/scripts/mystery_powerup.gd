extends Node2D

func _ready():
	var powerUpHitbox = $PowerUpHitbox
	powerUpHitbox.power_up_hitbox_hit.connect(_on_power_up_hitbox_hit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_power_up_hitbox_hit() -> void:
	print("hit!")
