extends Control

func pause():
	show()
	get_tree().paused = true

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://SCENE/start_menu.tscn")

func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	hide()
