extends Node

const TEST = preload("uid://bmmyh1r4ppj3q")
signal turn (int)
func _ready():
	$MC.action.connect(_on_mc_action)
	DialogueManager.show_dialogue_balloon(TEST)
	
func _on_mc_action():
	turn.emit(1)
	pass
