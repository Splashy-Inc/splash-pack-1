extends Node2D
#VERSION 1

@onready var start = $Interactables/Start
@onready var exit = $Interactables/Exit
@onready var player = $player
@onready var ui_layer = $UILayer

@export var next_level : PackedScene = null
@export var is_final_level: bool = false

#SET UP
func _ready():
	player.global_position = start.get_spawn_position()
	exit.body_entered.connect(_on_exit_body_entered)

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func reset_player():
	player.reset()

func _on_exit_body_entered(body):
	if body is Player:
		if is_final_level || (next_level != null):
			body.shrink() 
			await get_tree().create_timer(.5).timeout
			if is_final_level:
				ui_layer.show_win_screen(true)
			else:
				get_tree().change_scene_to_packed(next_level)


#Interactables Abilites

func _on_speed_boost_touched_player():
	pass # Replace with function body.

func _on_star_touched_player():
	reset_player()

func _on_comet_touched_player():
	reset_player()
