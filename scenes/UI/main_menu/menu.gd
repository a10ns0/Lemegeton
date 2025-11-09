extends Control


func _on_button_pressed2():
	get_tree().change_scene_to_file("res://scenes/UI/level_selector/level_selector.tscn")


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/UI/level_selector/level_selector.tscn")
