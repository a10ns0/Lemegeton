extends Area2D

const tile_size: Vector2 = Vector2(16,16)
var sprite_node_pos_tween: Tween

func _ready():
	MC.turn.connect(_on_mc_turn)
	
func _on_mc_turn(contador):
	_move(Vector2(0,-1))

func _move(dir: Vector2):
	global_position += dir * tile_size
	$Sprite2D.global_position -= dir * tile_size
	
	if sprite_node_pos_tween:
		sprite_node_pos_tween.kill()
	sprite_node_pos_tween = create_tween()
	sprite_node_pos_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	sprite_node_pos_tween.tween_property($Sprite2D, "global_position", global_position, 0.2).set_trans(Tween.TRANS_SINE)
