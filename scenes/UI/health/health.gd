extends Control
@onready var level = get_parent()
var health = 3
@onready var _1 = $"PanelContainer/HBoxContainer/1"
@onready var _2 = $"PanelContainer/HBoxContainer/2"
@onready var _3 = $"PanelContainer/HBoxContainer/3"

func _on_dealt_damage():
	health-=1
	if _1.visible:
		_1.visible = false
	elif _2.visible:
		_2.visible = false
	elif _3.visible:
		_3.visible = false

		await  get_tree().create_timer(0.3).timeout
		call_deferred("change_scene")
	
func change_scene():
	get_tree().change_scene_to_file("res://scenes/UI/game_over/game_over.tscn")
	
