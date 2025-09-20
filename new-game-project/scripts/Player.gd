extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -400.0
@export var portal_distance: float = 100.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var portal: Node2D
var is_controlling_portal: bool = false

func _ready():
# Find the portal in the scene
portal = get_node("../Portal")
if not portal:
print("Warning: Portal not found!")

func _physics_process(delta):
handle_movement(delta)
handle_portal_control()
move_and_slide()

func handle_movement(delta):
# Add gravity
if not is_on_floor():
velocity.y += gravity * delta

# Handle jump
if Input.is_action_just_pressed("ui_accept") and is_on_floor():
velocity.y = jump_velocity

# Handle horizontal movement
var direction = Input.get_axis("ui_left", "ui_right")
if direction != 0:
velocity.x = direction * speed
else:
velocity.x = move_toward(velocity.x, 0, speed)

func handle_portal_control():
# Toggle portal control with space
if Input.is_action_just_pressed("ui_select"):
is_controlling_portal = !is_controlling_portal

if is_controlling_portal and portal:
# Move portal with player input
var direction = Input.get_axis("ui_left", "ui_right")
portal.position.x += direction * speed * get_process_delta_time()

# Keep portal at a fixed distance above player
portal.position.y = position.y - portal_distance

# Spawn tetris piece with 'S' key
if Input.is_action_just_pressed("ui_up"):
portal.spawn_tetris_piece()
