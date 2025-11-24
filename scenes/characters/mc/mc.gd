extends CharacterBody2D


#variable que contiene el audio de herida cuando le hacen daño al personaje
@onready var audio_hurt_player_2d =$Audio/Audio_hurt
@onready var audio_collect_key =$Audio/collect_key
@onready var audio_coin =$Audio/Audio_coin
@onready var audio_poison =$Audio/Audio_poison
var current_interact_area: Area2D = null
const tile_size: Vector2 = Vector2(16,16)
var sprite_node_pos_tween: Tween

##referencia a animacion de damage para player
@onready var animation_player: AnimationPlayer = $AnimationPlayer


signal action()
signal damage()
signal interact()
signal push()
func _ready():
	add_to_group("player")
func _process(delta: float) -> void:
	if current_interact_area != null:
		if Input.is_action_just_pressed("interact"): 
			print("¡Interacción realizada!")
			action.emit()
			interact.emit()			
			
			##Se hace una diferenciacion entre que elemento es para reproducir el audio
			if current_interact_area.is_in_group("coin"):
				audio_coin.play() 
			elif current_interact_area.is_in_group("key"):
				audio_collect_key.play()
			elif current_interact_area.is_in_group("poison"):
				audio_poison.play() 	
			
			##Se elimina el area
			current_interact_area.queue_free()
			current_interact_area = null
				
				
				
				
			
func _physics_process(_delta: float) -> void:
	if !sprite_node_pos_tween or !sprite_node_pos_tween.is_running():
		if Input.is_action_just_pressed("ui_up"):
			action.emit()
			if !$Up.is_colliding():
				_move(Vector2(0,-1))
			elif $Up.get_collider().is_in_group("push"):
				push.emit()
			
			
		elif Input.is_action_just_pressed("ui_down"):
			action.emit()
			if !$Down.is_colliding():
				_move(Vector2(0,1))
			
			
		elif Input.is_action_just_pressed("ui_left"):
			action.emit()
			##direccion de donde está mirando el personaje
			scale.x=-1
			if !$Left.is_colliding():
				_move(Vector2(-1,0))
			
			
		elif Input.is_action_just_pressed("ui_right"):
			action.emit()
			##direccion de donde está mirando el personaje
			scale.x=1
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
		damage.emit()
		animation_player.play("damage")
		audio_hurt_player_2d.play()
		
	if area.is_in_group("interact"):
		current_interact_area = area 
		print("Ahora puedes interactuar.")

func _on_detection_area_area_exited(area: Area2D) -> void:
	if area == current_interact_area:
		current_interact_area = null
		print("Ya no estás en el área de interacción.")

		


	
