extends Node2D

var current_interact_area: Area2D = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("coin")
	
func _on_detection_area_area_entered(area: Area2D) -> void:
	print("Área detectada:", area.name)
	current_interact_area = area
	if area.is_in_group("player"):
		$Control.visible = true

func _on_detection_area_area_exited(area: Area2D) -> void:
	if area == current_interact_area:
		current_interact_area = null
		print("Ya no estás en el área de interacción.")
