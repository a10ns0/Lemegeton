extends Control
# --- Función para manejar la entrada de teclado ---
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		get_viewport().set_input_as_handled()
		get_tree().change_scene_to_file("res://scenes/UI/main_menu/menu.tscn")
