extends Node2D

var boost_vect = Vector2(0, .5)

signal touched_player

func _ready():
	print(rad_to_deg(rotation))
	print(boost_vect)
	boost_vect = boost_vect.rotated(rotation)
	print(boost_vect)

func _on_area_2d_body_entered(body):
	if body is Player:
		var player_speed = body.velocity.length()
		body.velocity += player_speed * boost_vect
