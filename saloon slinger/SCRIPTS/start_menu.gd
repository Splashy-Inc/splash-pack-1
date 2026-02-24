extends Node

@export var level_scene : PackedScene

@onready var main_menu: Control = $MainMenu

func _on_play_button_pressed() -> void:
	main_menu.hide()
	add_child(level_scene.instantiate())
