extends Control

@onready var pause_menu: Control = $PauseMenu

func _on_pause_button_pressed() -> void:
	pause_menu.pause()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		_on_pause_button_pressed()
