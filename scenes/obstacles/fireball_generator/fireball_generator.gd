extends Node2D


const fireball = preload("res://scenes/obstacles/fireball_generator/fireball/fire_ball.tscn")
var cont = 0
signal fire_turn()
func _on_mc_turn(contador):
	cont += contador
	fire_turn.emit()
	
	if cont >= 3:
		var shoot = fireball.instantiate()
		self.add_child(shoot)
		cont = 0
	fire_turn.emit(1)
	pass
