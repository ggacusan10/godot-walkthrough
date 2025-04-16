extends Object
class_name GameState

const MAX_LIVES: int = 3

# Keeps track of which nodes were collected by the player
# to avoid respawning said nodes when the player respawns
var collected_coins: Dictionary = {}
var collected_fruits: Dictionary = {}
var killed_slimes: Dictionary = {}

# Keeps track of number of `item` collected
var coins: int = 0
var fruits: int = 0
var slimes: int = 0

var is_game_over: bool = false
var did_win: bool = false

var lives: int = MAX_LIVES

var last_checkpoint: Vector2 = Vector2(-10.0, 0.0)
