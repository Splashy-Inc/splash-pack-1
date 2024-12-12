extends Node2D

@onready var spawn_pos = $SpawnPosition

func get_spawn_posistion():
	return spawn_pos.global_position
