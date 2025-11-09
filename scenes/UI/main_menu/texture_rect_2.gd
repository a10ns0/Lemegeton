extends TextureRect

@export var rotation_speed: float = 1.5
@export var rotation_limit: float = 6.0
@export var float_amplitude: float = 5.0      # píxeles de movimiento vertical
@export var float_speed: float = 2.0

var _direction := 1
var _angle := 0.0
var _time := 0.0
var _base_position := Vector2.ZERO

func _ready():
	_base_position = position

func _process(delta: float) -> void:
	_angle += rotation_speed * _direction * delta
	if abs(_angle) >= rotation_limit:
		_direction *= -1
	rotation_degrees = _angle

	_time += delta
	position.y = _base_position.y + sin(_time * float_speed) * float_amplitude
