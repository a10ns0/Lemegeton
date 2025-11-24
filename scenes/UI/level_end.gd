extends Area2D


@onready var audio: AudioStreamPlayer = $Audio



func _on_body_entered(body):
	if body.is_in_group("player"):
		var next_scene = Global.get_next_level()
		if next_scene:
			audio.play()
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file(next_scene)
			Global.advance_level()
		else:
			print("No hay más niveles.")
