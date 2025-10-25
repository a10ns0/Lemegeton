extends Control

@onready var icon = $Panel/Icon
@onready var panel = $Panel

func setup_card(icon_texture: Texture, number: int, border_color: Color):
	icon.texture = icon_texture

	var style = StyleBoxFlat.new()
	style.border_color = border_color
	style.border_width_all = 4
	style.bg_color = Color(0.1, 0.1, 0.1)  # Fondo oscuro
	panel.add_theme_stylebox("panel", style)
