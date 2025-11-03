extends Control
@onready var level = get_parent()
var health = 3
@onready var _1 = $"PanelContainer/HBoxContainer/1"
@onready var _2 = $"PanelContainer/HBoxContainer/2"
@onready var _3 = $"PanelContainer/HBoxContainer/3"

func _ready():
	level.dmg.connect(_on_mc_damage)
func _on_mc_damage(cont):
	health-=1
	if _1.visible:
		_1.visible = false
	elif _2.visible:
		_2.visible = false
	elif _3.visible:
		_3.visible = false
		get_tree().change_scene_to_file("res://scenes/UI/level_selector/level_selector.tscn")
	
	
