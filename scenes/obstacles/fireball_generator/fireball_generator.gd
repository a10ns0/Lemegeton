extends Node2D

@onready var turn = get_parent()

func _ready():
	turn.turn.connect(_on_turn)
	
const fireball = preload("res://scenes/obstacles/fireball_generator/fireball/fire_ball.tscn")
var cont = 0
func _on_turn(contador):
	cont += contador	
	if cont >= 3:
		var shoot = fireball.instantiate()
		add_child(shoot)
		cont = 0
	pass
