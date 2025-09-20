extends Node

# Reference to the tetris piece scene
@export var tetris_piece_scene: PackedScene

func _ready():
	# Load the tetris piece scene
	tetris_piece_scene = preload("res://scenes/TetrisPiece.tscn")

func _input(event):
	# Spawn a piece when you press the spacebar
	if event.is_action_pressed("ui_accept"):
		spawn_tetris_piece()

func spawn_tetris_piece():
	# Create a new tetris piece
	var new_piece = tetris_piece_scene.instantiate()
	
	# Position it above the screen
	new_piece.position = Vector2(0, -100)
	
	# Add it to the scene
	get_parent().add_child(new_piece)
	
	print("Spawned a tetris piece!")
