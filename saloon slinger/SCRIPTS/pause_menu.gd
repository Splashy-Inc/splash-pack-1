extends Control



func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	hide()


func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func pause():
	show()
	get_tree().paused = true


func _on_quit_button_pressed() -> void:
	Globals.return_to_main_menu.emit()
