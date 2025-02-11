extends Node2D

var boost_multiplier = 1.5

signal touched_player

func _on_area_2d_body_entered(body):
	if body is Player:
		body.velocity *= boost_multiplier
	if visible:
		$AudioStreamPlayer.play()
		await $AudioStreamPlayer.finished
