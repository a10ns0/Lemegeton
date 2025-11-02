extends Control

func _on_button_pressed(path):
	get_tree().change_scene_to_file(path)
