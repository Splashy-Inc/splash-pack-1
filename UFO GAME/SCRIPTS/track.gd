extends Node2D

var body_array := []

func _on_area_2d_body_exited(body):
	if body in body_array:
		get_tree().reload_current_scene()




func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body in body_array:
		body_array.append(body)
