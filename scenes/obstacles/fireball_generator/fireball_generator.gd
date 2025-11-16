extends Node2D

const fireball = preload("res://scenes/obstacles/fireball_generator/fireball/fire_ball.tscn")
var cont = 0
func _on_turn():
	cont += 1	
	if cont >= 3:
		var shoot = fireball.instantiate()
		shoot.position = self.global_position
		get_parent().add_child(shoot)
		cont = 0
	pass
