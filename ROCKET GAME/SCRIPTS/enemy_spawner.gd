extends Node2D

signal shark_spawned(shark_instance)
signal path_enemy_spawned(path_enemy_instance)

var shark_scene = preload("res://SCENES/shark.tscn")
var path_enemy_scene = preload("res://SCENES/path_enemy.tscn")

@onready var spawn_positions = $SpawnPositions

func _on_timer_timeout():
	_spawn_shark()

func _spawn_shark():
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_position = spawn_positions_array.pick_random()
	var shark_instance = shark_scene.instantiate()
	shark_instance.global_position = random_spawn_position.global_position
	emit_signal("shark_spawned", shark_instance)

func _on_path_enemy_timer_timeout():
	spawn_path_enemy()
	
func spawn_path_enemy():
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)
