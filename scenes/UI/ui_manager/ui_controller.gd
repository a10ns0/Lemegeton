extends Node

const scene_p = "res://Scenes/"

const transitions = {
	"fade_to_black": "res://Scenes/UI/ui_manager/transition_layer.tscn"
}

signal scene_loaded(scene_name)

var current_scene = null

func _ready():
	current_scene = get_tree().current_scene

func load_scene(route ,scene_name, transition_type = "fast"):
	var scene_path = scene_p  + route + scene_name + ".tscn"
	var new_scene_packed = load(scene_path)
	if not new_scene_packed:
		print("Error: No se pudo cargar la escena ", scene_name)
		return

	if transition_type == "fast" or not transitions.has(transition_type):
		if current_scene:
			current_scene.queue_free()
			current_scene = null
		
		var new_scene = new_scene_packed.instantiate()
		get_tree().root.add_child(new_scene)
		get_tree().current_scene = new_scene
		current_scene = new_scene
		
		print("Escena '", scene_name, "' cargada rápidamente.")
		scene_loaded.emit(scene_name)
		return
	
	var transition_path = transitions[transition_type]
	var transition_scene_packed = load(transition_path)
	if not transition_scene_packed:
		print("Error: La transición ", transition_type, " no se pudo cargar.")
		return

	var transition_scene = transition_scene_packed.instantiate()
	get_tree().root.add_child(transition_scene)
	
	var anim_player = transition_scene.get_node("AnimationPlayer")
	
	# Inicia la animación de desvanecimiento a negro.
	anim_player.play("fade_out")
	await anim_player.animation_finished
	
	# se libera la escena con la pantalla full negra
	if current_scene:
		current_scene.queue_free()
		current_scene = null
	
	var new_scene = new_scene_packed.instantiate()
	get_tree().root.add_child(new_scene)
	get_tree().current_scene = new_scene
	current_scene = new_scene
	
	print("Escena '", scene_name, "' cargada con transición '", transition_type, "'.")
	
	anim_player.play("fade_in")
	await anim_player.animation_finished
	
	transition_scene.queue_free()
	
	scene_loaded.emit(scene_name)
