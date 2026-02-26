extends Button

class_name GameButton

@export var game_scene : PackedScene
@export var game_texture : Texture2D
@export var game_name : String

func _ready() -> void:
	$GameTexture.texture = game_texture
	$Label.text = game_name
	$Label.hide()

func _on_pressed() -> void:
	Globals.game_selected.emit(game_scene)


func _on_mouse_entered() -> void:
	$Label.show()

func _on_mouse_exited() -> void:
	$Label.hide()
