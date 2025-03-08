extends Node2D

var boost_multiplier = 3

signal touched_player

func _on_area_2d_body_entered(body):
	if body is Player:
		body.add_speed_influencer(self)

func _on_area_2d_body_exited(body):
	if body is Player:
		body.remove_speed_influencer(self)
