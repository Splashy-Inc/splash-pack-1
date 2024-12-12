extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI
@onready var enemy_hit_sound = $EnemyHitSound
@onready var lazer_sound = $LazerSound
@onready var player_hit_sound = $PlayerHitSound

var game_over_scene = preload("res://SCENES/game_over_screen.tscn")

func _ready():
	hud.set_score_lable(score)
	hud.set_lives(lives)

func _on_death_zone_area_entered(area):
	area.queue_free()


func _on_player_took_damage():
	player_hit_sound.play()
	lives -= 1
	hud.set_lives(lives)
	if lives == 0:
		player.die()
		
		
		await get_tree().create_timer(1.5).timeout
		
		var game_over_screen = game_over_scene.instantiate()
		game_over_screen.set_score(score)
		ui.add_child(game_over_screen)


func _on_enemy_spawner_shark_spawned(shark_instance):
	shark_instance.connect("died", on_shark_died)
	add_child(shark_instance)
	
func on_shark_died():
	score += 10
	hud.set_score_lable(score)
	enemy_hit_sound.play()


func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance):
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", on_shark_died)
