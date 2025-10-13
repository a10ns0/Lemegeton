extends Node

const TEST = preload("uid://bmmyh1r4ppj3q")

func _ready():
	DialogueManager.show_dialogue_balloon(TEST)
