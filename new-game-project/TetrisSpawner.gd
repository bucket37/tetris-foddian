extends Node

# Reference to the tetris piece scene
@export var tetris_piece_scene: PackedScene
@export var tetris_piece_scene_2: PackedScene


func _ready():
	randomize()
	tetris_piece_scene = preload("res://scenes/TetrisPiece.tscn")
	tetris_piece_scene_2 = preload("res://tetris_piece_2.tscn")

func _input(event):
	# Spawn a piece when you press the spacebar
	if event.is_action_pressed("ui_accept"):
		spawn_tetris_piece()

func spawn_tetris_piece():
	var selected_scene: PackedScene
	
	# Randomly choose one of the two scenes
	if randi() % 2 == 0:
		selected_scene = tetris_piece_scene
	else:
		selected_scene = tetris_piece_scene_2
	
	var new_piece = selected_scene.instantiate()
	
	# Use a fixed position or your own logic
	new_piece.position = Vector2(0, -100)  # Or any other spawn point
	
	get_parent().add_child(new_piece)
	print("Spawned a tetris piece!")
