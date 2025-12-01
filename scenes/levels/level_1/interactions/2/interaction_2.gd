extends Area2D

@onready var foreground = $"../Node2D/Foreground"
var tileset_number = 0
var problem1 = Vector2(7,7)
var problem2 = Vector2(8,7)
var problem3 = Vector2(7,9)
var problem4 = Vector2(8,9)
var current_interact_area: Area2D = null
# Called when the node enters the scene tree for the first time.
	
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
	foreground.set_cell(Vector2(20,5),tileset_number,Vector2(-1,-1))
	foreground.set_cell(Vector2(20,6),tileset_number,Vector2(-1,-1))
	foreground.set_cell(Vector2(21,5),tileset_number,Vector2(-1,-1))
	foreground.set_cell(Vector2(21,6),tileset_number,Vector2(-1,-1))
	foreground.set_cell(Vector2(20,3),tileset_number,problem1)
	foreground.set_cell(Vector2(21,3),tileset_number,problem2)
	foreground.set_cell(Vector2(20,4),tileset_number,problem3)
	foreground.set_cell(Vector2(21,4),tileset_number,problem4)
