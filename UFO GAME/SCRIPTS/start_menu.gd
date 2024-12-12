extends Control

#START MENU BUTTONS

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://SCENE/level_1.tscn")

func _on_levels_button_pressed():
	get_tree().change_scene_to_file("res://SCENE/level_menu.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
