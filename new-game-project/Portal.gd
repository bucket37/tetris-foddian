extends Node2D

@export var tetris_piece_scene: PackedScene
@export var tetris_piece_2: PackedScene
@export var grid_size: int = 32
@export var spawn_interval: float = 2.0
@export var speed_boost: float = 0.5

var preview_piece: Sprite2D
var is_controlling_portal: bool = false
var spawn_timer: float = 0.0
var current_spawn_interval: float = 2.0
var active_piece: Node2D = null

func _ready():
	randomize()
	tetris_piece_scene = preload("res://scenes/TetrisPiece.tscn")
	tetris_piece_2 = preload("res://tetris_piece_2.tscn")

	create_preview_piece()
	position = Vector2(0, -100)
	current_spawn_interval = spawn_interval


	create_preview_piece()
	position = Vector2(0, -100)
	current_spawn_interval = spawn_interval

func create_preview_piece():
	preview_piece = Sprite2D.new()
	var texture = ImageTexture.new()
	var image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	image.fill(Color(1, 1, 1, 0.3))
	texture.set_image(image)
	preview_piece.texture = texture
	add_child(preview_piece)

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			is_controlling_portal = !is_controlling_portal
			print("Portal control: ", is_controlling_portal)
		
		
		

	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		current_spawn_interval = speed_boost
		print("Speed boost activated!")


func _process(delta):
	if is_controlling_portal:
		spawn_timer += delta
		if spawn_timer >= current_spawn_interval:
			spawn_tetris_piece()
			spawn_timer = 0.0
			current_spawn_interval = spawn_interval

		var mouse_pos = get_global_mouse_position()
		position.x = mouse_pos.x
		position = snap_to_grid(position)

func snap_to_grid(pos: Vector2) -> Vector2:
	var grid_x = round(pos.x / grid_size) * grid_size
	var grid_y = round(pos.y / grid_size) * grid_size
	return Vector2(grid_x, grid_y)

func spawn_tetris_piece():
	var selected_scene: PackedScene
	if randi() % 2 == 0:
		selected_scene = tetris_piece_scene
	else:
		selected_scene = tetris_piece_2
	
	if selected_scene == null:
		print("ERROR: Selected scene is null!")
		return
	
	var new_piece = selected_scene.instantiate()
	new_piece.position = position
	get_parent().add_child(new_piece)

	active_piece = new_piece  
	print("Spawned tetris piece!")
