extends CharacterBody2D


#variable que contiene el audio de herida cuando le hacen daño al personaje
@onready var audio_hurt_player_2d =$Audio/Audio_hurt
@onready var audio_collect_key =$Audio/collect_key
@onready var audio_coin =$Audio/Audio_coin
@onready var audio_poison =$Audio/Audio_poison

const tile_size: Vector2 = Vector2(16,16)
var sprite_node_pos_tween: Tween
signal turn(int)

### Stats personaje
var lifes = 3

func _ready():
	add_to_group("player")

func _physics_process(_delta: float) -> void:
	if !sprite_node_pos_tween or !sprite_node_pos_tween.is_running():
		if Input.is_action_just_pressed("ui_up") and !$Up.is_colliding():
			_move(Vector2(0,-1))
			turn.emit(1)
			
			
		elif Input.is_action_just_pressed("ui_down") and !$Down.is_colliding():
			_move(Vector2(0,1))
			turn.emit(1)
			
			
		elif Input.is_action_just_pressed("ui_left") and !$Left.is_colliding():
			_move(Vector2(-1,0))
			turn.emit(1)
			
			
		elif Input.is_action_just_pressed("ui_right") and !$Right.is_colliding():
			_move(Vector2(1,0))
			turn.emit(1)
			
			
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
	if area.is_in_group("fireball") or area.name == "AreaPeak":
		print("Área detectada:", area.name)
		audio_hurt_player_2d.play()
		lifes-=1
	
	if	area.name == "AreaKey":
		print("Área detectada:", area.name)
		audio_collect_key.play()
	
	if area.name == "AreaCoin":
		print("Área detectada:", area.name)
		audio_coin.play()
	
	if area.name == "AreaPoison":
		print("Área detectada:", area.name)
		audio_poison.play()
		
		
