extends Node

@export var intro_scene : PackedScene
@export var levels_menu_scene : PackedScene

var cur_screen : Node

@onready var start_menu: Control = $StartMenu

func _on_start_button_pressed():
	start_menu.hide()
	_on_level_selected(intro_scene)

func _on_levels_button_pressed(): 
	start_menu.hide()
	cur_screen = levels_menu_scene.instantiate()
	add_child(cur_screen)
	cur_screen.level_selected.connect(_on_level_selected)

func _on_quit_button_pressed():
	Globals.return_to_main_menu.emit()

func _on_level_selected(level_scene: PackedScene):
	if is_instance_valid(cur_screen):
		cur_screen.queue_free()
	cur_screen = level_scene.instantiate()
	add_child(cur_screen)
	cur_screen.level_selected.connect(_on_level_selected)
	cur_screen.level_reset.connect(_on_level_selected.bind(level_scene))
	cur_screen.menu_pressed.connect(_on_menu_requested)

func _on_menu_requested():
	if is_instance_valid(cur_screen):
		cur_screen.queue_free()
	cur_screen = start_menu
	start_menu.show()
