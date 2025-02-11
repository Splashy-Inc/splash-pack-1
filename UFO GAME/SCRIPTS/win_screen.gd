extends Control

func _ready() -> void:
	Globals.eggs_collected_updated.connect(_on_game_over)
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://SCENE/start_menu.tscn")

func _on_game_over():
	$Score.text = "SCORE: " + str(Globals.eggs_collected) + "/231"
