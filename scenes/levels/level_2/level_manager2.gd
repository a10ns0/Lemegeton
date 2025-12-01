extends Node
var cont = 0
const traps = "trap"
const turn = "_on_turn"
func _ready():
	$MC.action.connect(_on_mc_action)
	$MC.damage.connect(_on_mc_damage)
	$MC.interact.connect(_on_mc_interact)
	$Health.die.connect(_on_health_die)
func _on_mc_action():
	get_tree().call_group(traps, turn)
	$Move.add_move()
	pass
func _on_mc_damage():
	$Health._on_dealt_damage()
	pass
func _on_mc_interact():
	$Move.add_move()
	cont+=1
	if cont == 1:
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://scenes/levels/level_3/level_3.tscn")
func _on_health_die():
	$MC._on_health_die()
	$GameOver.visible = true
	
	
