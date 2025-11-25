extends Node2D


# Lista de los grupos que existen en este nivel (asegúrate que sean los nombres EXACTOS de los grupos)
var objetivos_posibles = ["coin", "key", "poison"] 
var secuencia_a_seguir = [] # Aquí guardaremos el orden aleatorio
var paso_actual = 0 # En qué paso de la secuencia va el jugador



var current_interact_area: Area2D 

const traps = "trap"
const turn = "_on_turn"

func _ready():
	$MC.action.connect(_on_mc_action)
	$MC.damage.connect(_on_mc_damage)
	
	# La conexión de interact ahora recibirá el dato automáticamente
	$MC.interact.connect(_on_mc_interact)
	
	# GENERAR ORDEN ALEATORIO
	randomize() # Importante para que sea aleatorio real cada vez
	secuencia_a_seguir = objetivos_posibles.duplicate()
	secuencia_a_seguir.shuffle() # Mezcla el array
	
	# IMPORTANTE: Imprimir para que TÚ sepas el orden al probar (luego harás una UI)
	print("ORDEN REQUERIDO: ", secuencia_a_seguir)

func _on_mc_action():
	get_tree().call_group(traps, turn)

func _on_mc_damage():
	$Health._on_dealt_damage()

# Esta función ahora recibe el argumento que enviamos desde mc.gd
func _on_mc_interact(tipo_objeto_recibido, area):
	# Verificamos si el objeto recogido es el que tocaba en este turno
	if tipo_objeto_recibido == secuencia_a_seguir[paso_actual]:
		print("¡Correcto! Recogiste: " + tipo_objeto_recibido)
		paso_actual += 1
		area.queue_free()
		
		# Verificamos si completó la secuencia entera
		if paso_actual >= secuencia_a_seguir.size():
			print("¡NIVEL COMPLETADO!")
			call_deferred("cambiar_nivel")
			
	else:
		print("¡ERROR! Esperaba " + secuencia_a_seguir[paso_actual] + " pero recogiste " + tipo_objeto_recibido)
		tratar_error_jugador()

func cambiar_nivel():
	get_tree().change_scene_to_file("res://scenes/levels/level_1/level_1.tscn")

func tratar_error_jugador():
	# Aquí decides qué pasa si se equivoca. 
	# Opción A: Reiniciar el nivel
	# get_tree().reload_current_scene()
	
	# Opción B: Hacerle daño
	$MC.damage.emit() 
	$MC/AnimationPlayer.play("damage")
	$MC/Audio/Audio_hurt.play()
