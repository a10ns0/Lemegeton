extends Node

## Script que contiene como variables globales las rutas de las escenas

var levels := [
	"res://scenes/levels/level_1/level_1.tscn",
	"res://scenes/levels/level_2/level_2.tscn",
	"res://scenes/levels/level_3/level_3.tscn",
    "res://scenes/levels/level_4/level_4.tscn"
]

var current_level_index := 0

func get_next_level():
	if current_level_index < levels.size():
		return levels[current_level_index]
	return null  # ya no hay más niveles

func advance_level():
	current_level_index += 1
