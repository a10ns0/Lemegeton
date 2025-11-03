extends Node
const TEST = preload("uid://bmmyh1r4ppj3q")

signal turn (int)
signal dmg (int)
func _ready():
	$MC.action.connect(_on_mc_action)
	$MC.damage.connect(_on_mc_damage)
	DialogueManager.show_dialogue_balloon(TEST,"Start")
	
func _on_mc_action(cont):
	turn.emit(1)
	pass
func _on_mc_damage(cont):
	dmg.emit(1)
	pass
	
