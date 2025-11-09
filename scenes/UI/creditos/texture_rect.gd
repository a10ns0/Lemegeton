extends TextureRect

func _process(delta):
	if material and material is ShaderMaterial:
		var time_passed = Time.get_ticks_msec() / 1000.0
		material.set_shader_parameter("time", time_passed)
