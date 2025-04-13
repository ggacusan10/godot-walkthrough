extends Node2D

@onready var fruit: Node2D = $Fruit
@onready var power_up_hitbox: Area2D = $PowerUpHitbox

@onready var grass_mystery_power_up: Sprite2D = $AnimatableBody2D/GrassMysteryPowerUp
@onready var sand_mystery_power_up: Sprite2D = $AnimatableBody2D/SandMysteryPowerUp
@onready var rock_mystery_power_up: Sprite2D = $AnimatableBody2D/RockMysteryPowerUp
@onready var ice_mystery_power_up: Sprite2D = $AnimatableBody2D/IceMysteryPowerUp

@export var power_up_box_to_show: String = "GRASS"

const GRASS = "GRASS"
var SAND = "SAND"
var ROCK = "ROCK"
var ICE = "ICE"

var mystery_power_ups = {}

func _ready():
	var powerUpHitbox = $PowerUpHitbox
	powerUpHitbox.power_up_hitbox_hit.connect(_on_power_up_hitbox_hit)
	fruit.grabbed_fruit.connect(_on_grabbed_fruit)
	
	grass_mystery_power_up.visible = false
	sand_mystery_power_up.visible = false
	rock_mystery_power_up.visible = false
	ice_mystery_power_up.visible = false
	
	mystery_power_ups = {
		GRASS: grass_mystery_power_up,
		SAND: sand_mystery_power_up,
		ROCK: rock_mystery_power_up,
		ICE: ice_mystery_power_up,		
	}
	
	if not power_up_box_to_show or not mystery_power_ups.get(power_up_box_to_show):
		var err_msg = "Mystery Powerup must be one of the following: " + str(mystery_power_ups.keys())
		push_error(err_msg)
		get_tree().quit()
	else:
		mystery_power_ups.get(power_up_box_to_show).visible = true

func _on_power_up_hitbox_hit() -> void:
	print("[mystery_powerup.gd] Received signal that it was hit")
	fruit.get_fruit()

func _on_grabbed_fruit() -> void:
	print("[mystery_powerup.gd] Grabbed fruit")
	GameManager.add_fruit()
