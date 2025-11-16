extends Node2D



func _ready():
	$CollisionShape2D.disabled = true
	
func _on_turn():
	if $CollisionShape2D.disabled:
		$AnimatedSprite2D.play("up")
		$CollisionShape2D.disabled = false
	else:
		$AnimatedSprite2D.play("down")
		$CollisionShape2D.disabled = true
	
	
