extends Node2D


func _on_area_2d_body_exited(body):
	get_tree().reload_current_scene()
