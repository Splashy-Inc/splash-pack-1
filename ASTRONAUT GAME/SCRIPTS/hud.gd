extends Control

signal menu_pressed

func set_time_label(value):
	#$TimeLabel.text = "TIME: " + str(value)
	pass

func set_level_number(value):
	$LevelLable.text = "level: "



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_on_pause_button_pressed()
		get_viewport().set_input_as_handled()
		
		


func _on_pause_button_pressed() -> void:
	$Pause.pause()

func _on_menu_pressed():
	menu_pressed.emit()
