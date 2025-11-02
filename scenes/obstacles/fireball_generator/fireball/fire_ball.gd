extends Area2D

const tile_size: Vector2 = Vector2(16,16)
var sprite_node_pos_tween: Tween
@onready var fire = get_parent()
func _ready():
	add_to_group("fireball")
	fire.fire_turn.connect(_on_fire_turn)
	
func _on_fire_turn():
	_move(Vector2(0,-1))

func _move(dir: Vector2):
	global_position += dir * tile_size
	$AnimatedSprite2D.global_position -= dir * tile_size
	
	if sprite_node_pos_tween:
		sprite_node_pos_tween.kill()
	sprite_node_pos_tween = create_tween()
	sprite_node_pos_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	sprite_node_pos_tween.tween_property($AnimatedSprite2D, "global_position", global_position, 0.2).set_trans(Tween.TRANS_SINE)



	
