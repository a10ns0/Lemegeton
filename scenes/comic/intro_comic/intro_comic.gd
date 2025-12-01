extends CanvasLayer

var pag = 1
var viñeta
var current_page_index = 0
var max_page =3
func _unhandled_input(event):
	if event is InputEventKey and event.pressed:
		show_next_page()

func show_next_page():
	current_page_index += 1
	if current_page_index <= max_page:
		get_node(str(current_page_index)).visible = true
	else:
		get_tree().change_scene_to_file("res://scenes/UI/level_selector/level_selector.tscn")
