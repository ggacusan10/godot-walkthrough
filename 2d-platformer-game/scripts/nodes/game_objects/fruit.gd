extends Node2D

@onready var apple: Sprite2D = $Apple
@onready var orange: Sprite2D = $Orange
@onready var area_2d: Area2D = $Area2D
@onready var fruit: Node2D = $"."

var fruits = []

signal grabbed_fruit

func _ready():
	apple.visible = false
	orange.visible = false
	fruits = [apple, orange]
	
	# initialize the fruit to be in a different collision mask
	# so that the player cannot grab it right away.
	# The player must hit the powerup first for it to be grabbed.
	area_2d.collision_mask = 1

func get_fruit() -> void:
	var rng = RandomNumberGenerator.new()
	var random_fruit = rng.randi_range(0, len(fruits) - 1)

	print("fruit: ", fruits[random_fruit])

	# Make the fruit visible and grabbable
	fruits[random_fruit].visible = true
	area_2d.collision_mask = 2

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("Grabbed fruit by: ", body)
		grabbed_fruit.emit()
		fruit.queue_free()
		
