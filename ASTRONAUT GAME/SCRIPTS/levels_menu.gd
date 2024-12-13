extends Control

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://SCENE/start_menu.tscn")

#STORYLINE LEVEL BUTTONS

func _on_level_01_pressed() -> void:
	pass # Replace with function body.

func _on_level_02_pressed() -> void:
	pass # Replace with function body.

func _on_level_03_pressed() -> void:
	pass # Replace with function body.

func _on_level_04_pressed():
	get_tree().change_scene_to_file("res://SCENE/level_4.tscn")

func _on_level_05_pressed() -> void:
	pass # Replace with function body.

func _on_level_06_pressed() -> void:
	pass # Replace with function body.

func _on_level_07_pressed() -> void:
	pass # Replace with function body.

func _on_level_08_pressed() -> void:
	pass # Replace with function body.

func _on_level_09_pressed() -> void:
	pass # Replace with function body.


#BONUS LEVEL BUTTONS

func _on_b_l_1_pressed():
	get_tree().change_scene_to_file("res://SCENE/BL1.tscn")

func _on_b_l_2_pressed():
	get_tree().change_scene_to_file("res://SCENE/BL2.tscn")

func _on_b_l_3_pressed():
	get_tree().change_scene_to_file("res://SCENE/BL3.tscn")

func _on_b_l_4_pressed():
	get_tree().change_scene_to_file("res://SCENE/BL4.tscn")

func _on_b_l_5_pressed():
	get_tree().change_scene_to_file("res://SCENE/BL5.tscn")

func _on_b_l_6_pressed():
	get_tree().change_scene_to_file("res://SCENE/BL6.tscn")
