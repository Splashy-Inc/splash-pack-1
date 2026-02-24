extends Control

signal return_to_start_menu
signal level_selected(level_scene: PackedScene)

@export var start_menu_scene : PackedScene
@export var levels_scenes : Array[PackedScene]

func _on_back_button_pressed():
	Globals.game_selected.emit(start_menu_scene)

#Kromulon Levels

func _on_level_01_pressed():
	level_selected.emit(levels_scenes[0])

func _on_level_02_pressed():
	level_selected.emit(levels_scenes[1])

func _on_level_03_pressed():
	level_selected.emit(levels_scenes[2])

func _on_level_04_pressed():
	level_selected.emit(levels_scenes[3])

func _on_level_05_pressed():
	level_selected.emit(levels_scenes[4])

func _on_level_06_pressed():
	level_selected.emit(levels_scenes[5])

func _on_level_07_pressed():
	level_selected.emit(levels_scenes[6])

func _on_level_08_pressed():
	level_selected.emit(levels_scenes[7])

func _on_level_09_pressed():
	level_selected.emit(levels_scenes[8])

func _on_level_10_pressed() -> void:
	level_selected.emit(levels_scenes[9])


#Scobus 5 Levels

func _on_level_11_pressed() -> void:
	level_selected.emit(levels_scenes[10])

func _on_level_12_pressed() -> void:
	level_selected.emit(levels_scenes[11])

func _on_level_13_pressed() -> void:
	level_selected.emit(levels_scenes[12])

func _on_level_14_pressed() -> void:
	level_selected.emit(levels_scenes[13])

func _on_level_15_pressed() -> void:
	level_selected.emit(levels_scenes[14])

func _on_level_16_pressed() -> void:
	level_selected.emit(levels_scenes[15])

func _on_level_17_pressed() -> void:
	level_selected.emit(levels_scenes[16])

func _on_level_18_pressed() -> void:
	level_selected.emit(levels_scenes[17])

func _on_level_19_pressed() -> void:
	level_selected.emit(levels_scenes[18])

func _on_level_20_pressed() -> void:
	level_selected.emit(levels_scenes[19])
