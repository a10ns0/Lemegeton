extends Node
var cont = 0
const traps = "trap"
const turn = "_on_turn"
func _ready():
	$MC.action.connect(_on_mc_action)
	$MC.damage.connect(_on_mc_damage)
	$MC.interact.connect(_on_mc_interact)
	
func _on_mc_action():
	get_tree().call_group(traps, turn)
	pass
func _on_mc_damage():
	$Health._on_dealt_damage()
	pass
func _on_mc_interact():
	cont+=1
	if cont == 1:
		get_tree().change_scene_to_file("res://scenes/UI/continuara.tscn")
	
	
