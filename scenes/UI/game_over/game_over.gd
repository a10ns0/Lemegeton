extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await  get_tree().create_timer(7).timeout
	get_tree().change_scene_to_file("res://scenes/levels/level_1/level_1.tscn")
