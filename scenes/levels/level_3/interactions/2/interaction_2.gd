extends Area2D

@onready var foreground = $"../Node2D/Foreground"
var tileset_number = 0
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
	foreground.set_cell(Vector2(23,13),tileset_number,Vector2(-1,-1))
	foreground.set_cell(Vector2(24,13),tileset_number,Vector2(-1,-1))
	foreground.set_cell(Vector2(25,13),tileset_number,Vector2(-1,-1))
	foreground.set_cell(Vector2(24,14),tileset_number,Vector2(-1,-1))
	foreground.set_cell(Vector2(25,14),tileset_number,Vector2(-1,-1))
