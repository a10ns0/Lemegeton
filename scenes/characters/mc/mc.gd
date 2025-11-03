extends CharacterBody2D


#variable que contiene el audio de herida cuando le hacen daño al personaje
@onready var audio_hurt_player_2d =$Audio/Audio_hurt
@onready var audio_collect_key =$Audio/collect_key
@onready var audio_coin =$Audio/Audio_coin
@onready var audio_poison =$Audio/Audio_poison

const tile_size: Vector2 = Vector2(16,16)
var sprite_node_pos_tween: Tween
signal action(int)
signal damage(int)
signal interact()
func _ready():
	add_to_group("player")

func _physics_process(_delta: float) -> void:
	if !sprite_node_pos_tween or !sprite_node_pos_tween.is_running():
		if Input.is_action_just_pressed("ui_up"):
			action.emit(1)
			if !$Up.is_colliding():
				_move(Vector2(0,-1))
			
			
		elif Input.is_action_just_pressed("ui_down"):
			action.emit(1)
			if !$Down.is_colliding():
				_move(Vector2(0,1))
			
			
		elif Input.is_action_just_pressed("ui_left"):
			action.emit(1)
			if !$Left.is_colliding():
				_move(Vector2(-1,0))
			
			
		elif Input.is_action_just_pressed("ui_right"):
			action.emit(1)
			if !$Right.is_colliding():
				_move(Vector2(1,0))
			
			
			
func _move(dir: Vector2):
	global_position += dir * tile_size
	$AnimatedSprite2D.global_position -= dir * tile_size
	
	if sprite_node_pos_tween:
		sprite_node_pos_tween.kill()
	sprite_node_pos_tween = create_tween()
	sprite_node_pos_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	sprite_node_pos_tween.tween_property($AnimatedSprite2D, "global_position", global_position, 0.2).set_trans(Tween.TRANS_SINE)


##Señal que detecta cuando otra area golpea al jugador emitiendo un sonido (agregar eliminacion de vidas)
func _on_detection_area_area_entered(area: Area2D) -> void:
	print("Área detectada:", area.name)
	if area.is_in_group("damage"):
		damage.emit(1)
	if area.is_in_group("interactuable") and Input.is_action_just_pressed("interact"):
		action.emit(1)
		interact.emit()
	if	area.name == "AreaKey":
		print("Área detectada:", area.name)
		audio_collect_key.play()
	
	if area.name == "AreaCoin":
		print("Área detectada:", area.name)
		audio_coin.play()
	
	if area.name == "AreaPoison":
		print("Área detectada:", area.name)
		audio_poison.play()


	
