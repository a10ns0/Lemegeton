extends Node
var cont = 0
signal turn (int)
signal dmg (int)
func _ready():
	$MC.action.connect(_on_mc_action)
	$MC.damage.connect(_on_mc_damage)
	$MC.interact.connect(_on_mc_interact)
	
func _on_mc_action(cont):
	turn.emit(1)
	pass
func _on_mc_damage(cont):
	dmg.emit(1)
	pass
func _on_mc_interact():
	cont+=1
	if cont == 2:
		get_tree().change_scene_to_file("res://scenes/levels/level_3/level_3.tscn")
	
	
