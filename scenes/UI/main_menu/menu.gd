extends Control


func _on_button_pressed():
	UiController.load_scene("/UI/level_selector/","level_selector", "fade_to_black")
