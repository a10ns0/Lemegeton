extends Area2D

@onready var foreground = $"../Node2D/Foreground"
var tileset_number = 0
var problem1 = Vector2(6,12)
var problem2 = Vector2(7,12)
var problem3 = Vector2(8,12)
var problem4 = Vector2(9,12)
var problem5 = Vector2(10,12)
var problem6 = Vector2(6,13)
var problem7 = Vector2(7,13)
var problem8 = Vector2(8,13)
var problem9 = Vector2(9,13)
var problem10 = Vector2(10,13)
var problem11 = Vector2(6,14)
var problem12 = Vector2(7,14)
var problem13 = Vector2(8,14)
var problem14 = Vector2(9,14)
var problem15 = Vector2(10,14)

var current_interact_area: Area2D = null
	
func _on_detection_area_area_entered(area: Area2D) -> void:
	print("Área detectada:", area.name)
	current_interact_area = area
	if area.is_in_group("player"):
		$Control.visible = true

func _on_detection_area_area_exited(area: Area2D) -> void:
	if area == current_interact_area:
		current_interact_area = null
		$Control.visible = false
		print("Ya no estás en el área de interacción.")


func _on_tree_exiting():
	foreground.set_cell(Vector2(7,5),tileset_number,problem1)
	foreground.set_cell(Vector2(8,5),tileset_number,problem2)
	foreground.set_cell(Vector2(9,5),tileset_number,problem3)
	foreground.set_cell(Vector2(10,5),tileset_number,problem4)
	foreground.set_cell(Vector2(11,5),tileset_number,problem5)
	foreground.set_cell(Vector2(7,6),tileset_number,problem6)
	foreground.set_cell(Vector2(8,6),tileset_number,problem7)
	foreground.set_cell(Vector2(9,6),tileset_number,problem8)
	foreground.set_cell(Vector2(10,6),tileset_number,problem9)
	foreground.set_cell(Vector2(11,6),tileset_number,problem10)
	foreground.set_cell(Vector2(7,7),tileset_number,problem11)
	foreground.set_cell(Vector2(8,7),tileset_number,problem12)
	foreground.set_cell(Vector2(9,7),tileset_number,problem13)
	foreground.set_cell(Vector2(10,7),tileset_number,problem14)
	foreground.set_cell(Vector2(11,7),tileset_number,problem15)
	foreground.set_cell(Vector2(12,7),tileset_number,Vector2(-1,-1))
	foreground.set_cell(Vector2(7,8),tileset_number,Vector2(-1,-1))
