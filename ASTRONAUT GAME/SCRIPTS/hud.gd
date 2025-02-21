extends Control

func set_time_label(value):
	#$TimeLabel.text = "TIME: " + str(value)
	pass

func set_level_number(value):
	$LevelLable.text = "level: "



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		_on_pause_button_pressed()
		
		


func _on_pause_button_pressed() -> void:
	$Pause.pause()
