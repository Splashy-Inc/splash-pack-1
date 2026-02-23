extends Button

class_name GameButton

@export var game_scene : PackedScene

func _on_pressed() -> void:
	Globals.game_selected.emit(game_scene)
