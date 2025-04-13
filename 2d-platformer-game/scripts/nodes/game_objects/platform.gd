extends AnimatableBody2D

@onready var grass_platform: Sprite2D = $GrassPlatform
@onready var sand_platform: Sprite2D = $SandPlatform
@onready var rock_platform: Sprite2D = $RockPlatform
@onready var ice_platform: Sprite2D = $IcePlatform

@export var platform_to_show: String = "GRASS"

const GRASS = "GRASS"
const SAND = "SAND"
const ROCK = "ROCK"
const ICE = "ICE"

var platforms = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# initialize all platforms to invisible
	grass_platform.visible = false
	sand_platform.visible = false
	rock_platform.visible = false
	ice_platform.visible = false

	platforms = {
		GRASS: grass_platform,
		SAND: sand_platform,
		ROCK: rock_platform,
		ICE: ice_platform
	}
	
	if not platform_to_show or not platforms.get(platform_to_show):
		var err_msg ="Platform must be one of the following: " + str(platforms.keys())
		print(err_msg)
		push_error(err_msg)
		get_tree().quit()
	else:
		platforms.get(platform_to_show).visible = true
	
