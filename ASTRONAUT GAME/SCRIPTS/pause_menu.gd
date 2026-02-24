extends Control

signal menu_pressed

func pause():
	show()
	get_tree().paused = true

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	menu_pressed.emit()

func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	hide()
