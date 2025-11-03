extends Node2D

@onready var turno = get_parent()


func _ready():
	turno.turn.connect(_on_turn)
	$CollisionShape2D.disabled = true
	
func _on_turn(cont):
	if $CollisionShape2D.disabled:
		$AnimatedSprite2D.play("up")
		$CollisionShape2D.disabled = false
	else:
		$AnimatedSprite2D.play("down")
		$CollisionShape2D.disabled = true
	
	
