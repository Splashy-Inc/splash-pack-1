extends Button

class_name GameButton

@export var game_scene : PackedScene
@export var game_texture : Texture2D

func _ready() -> void:
	$GameTexture.texture = game_texture

func _on_pressed() -> void:
	Globals.game_selected.emit(game_scene)
