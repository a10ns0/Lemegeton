extends Node2D

# Tamaño del tile (debe coincidir con tu TileMap)
@export var TILE_SIZE: int = 16
@export var MOVE_SPEED: float = 200.0  # píxeles por segundo

# Estado del movimiento
var moving: bool = false
var target_position: Vector2
var direction: Vector2 = Vector2.ZERO

func _ready():
	# Inicializa la posición segura
	var pos = global_position if global_position != null else Vector2.ZERO

	# Centra el Player en el tile
	pos.x = floor(pos.x / TILE_SIZE) * TILE_SIZE + TILE_SIZE / 2
	pos.y = floor(pos.y / TILE_SIZE) * TILE_SIZE + TILE_SIZE / 2

	global_position = pos
	target_position = pos

func _process(delta: float) -> void:
	if not moving:
		handle_input()
	else:
		move_towards_target(delta)

func handle_input() -> void:
	direction = Vector2.ZERO

	if Input.is_action_just_pressed("ui_up"):
		direction = Vector2.UP
	elif Input.is_action_just_pressed("ui_down"):
		direction = Vector2.DOWN
	elif Input.is_action_just_pressed("ui_left"):
		direction = Vector2.LEFT
	elif Input.is_action_just_pressed("ui_right"):
		direction = Vector2.RIGHT

	if direction != Vector2.ZERO:
		start_move(direction)

func start_move(dir: Vector2) -> void:
	moving = true
	target_position = global_position + dir * TILE_SIZE
	# Aquí puedes agregar colisión si quieres

func move_towards_target(delta: float) -> void:
	var distance = global_position.distance_to(target_position)
	var step = MOVE_SPEED * delta

	if distance <= step:
		global_position = target_position
		moving = false
	else:
		global_position += (target_position - global_position).normalized() * step
