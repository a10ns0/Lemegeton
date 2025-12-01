extends CanvasLayer
var moves = 0
@onready var label = $MarginContainer/Label

func add_move():
	moves+=1
	label.text = str(moves)
