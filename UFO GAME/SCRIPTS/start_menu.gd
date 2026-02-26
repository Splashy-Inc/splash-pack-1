extends Control

#START MENU BUTTONS

@export var parent_path : String

func _ready() -> void:
	AudioPlayerWormholes.play()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://UFO GAME/SCENE/level_1.tscn")

func _on_levels_button_pressed():
	get_tree().change_scene_to_file("res://UFO GAME/SCENE/level_menu.tscn")

func _on_quit_button_pressed():
	if parent_path:
		AudioPlayerWormholes.stop()
		get_tree().change_scene_to_file(parent_path)
	else:
		Globals.return_to_main_menu.emit()
