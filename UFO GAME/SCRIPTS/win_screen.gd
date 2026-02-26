extends Control

func _ready() -> void:
	GlobalsWormholes.eggs_collected_updated.connect(_on_game_over)
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://UFO GAME/SCENE/start_menu.tscn")

func _on_game_over():
	$Score.text = "SCORE: " + str(GlobalsWormholes.eggs_collected) + "/231"
