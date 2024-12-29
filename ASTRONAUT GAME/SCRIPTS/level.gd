extends Node2D

@export var next_level: PackedScene = null
@export var is_final_level: bool = false

@onready var start = $Start
@onready var exit = $Exit
@onready var death_zone = $DeathZone
@onready var hud = $UILayer/HUD
@onready var ui_layer = $UILayer

var player = null

@export var level_time = 60 
var timer_node = null
var time_left 
var win = false

func _ready():
	player = get_tree().get_first_node_in_group("player")
	if player != null and start != null:
		player.global_position = start.get_spawn_posistion()
	var traps =  get_tree().get_nodes_in_group("traps")
	for trap in traps: 
		trap.touched_player.connect(_on_saw_touched_player)
		
	exit.body_entered.connect(_on_exit_body_entered)
	if death_zone != null:
		death_zone.body_entered.connect(_on_death_zone_body_entered)
	
	time_left = level_time
	if hud != null:
		hud.set_time_label(time_left)
	
	timer_node = Timer.new()
	timer_node.name = "Level Timer"
	timer_node.wait_time = 1
	timer_node.timeout.connect(_on_level_timer_timeout)
	add_child(timer_node)
	timer_node.start()

func _on_level_timer_timeout():
	if hud != null:
		if win == false:
			time_left -= 1
			if time_left < 0:
				reset_player()
				time_left = level_time
			hud.set_time_label(time_left)
	
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	
func _on_death_zone_body_entered(body):
	reset_player()
	time_left = level_time
	hud.set_time_label(time_left)
	

func _on_saw_touched_player():
	reset_player()
	time_left = level_time
	hud.set_time_label(time_left)

func reset_player():
	AudioPlayer.play_sfx("hurt")
	player.velocity = Vector2.ZERO
	player.global_position = start.get_spawn_posistion()
	
	
#Load next level
func _on_exit_body_entered(body):
	if body is Player:
		if is_final_level || (next_level !=null):
			exit.animate()
			player.active = false
			win = true
			await get_tree().create_timer(1.5).timeout
			if is_final_level:
				ui_layer.show_win_screen(true)
			else:
				get_tree().change_scene_to_packed(next_level)
			
	
