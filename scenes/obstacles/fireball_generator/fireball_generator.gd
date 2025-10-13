extends Node2D

const fireball = preload("res://scenes/obstacles/fireball_generator/fireball/fire_ball.tscn")
var cont = 0
signal fire_turn(int)

func _on_mc_turn(contador):
	cont += contador
	fire_turn.emit(1)
	if cont >= 3:
		var shoot = fireball.instantiate()
		get_parent().add_child(shoot)
	fire_turn.emit(1)
	pass
