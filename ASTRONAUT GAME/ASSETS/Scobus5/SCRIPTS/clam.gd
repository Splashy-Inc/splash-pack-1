extends Node2D

#Shoot Pearl
@export var pearl : PackedScene
@onready var positionPearl = $Marker2D 


#Shoot pearl every second

func _shoot_Pearl():
	var new_pearl = pearl.instantiate()
	if $AnimatedSprite2D.flip_h == true:
		positionPearl.position = Vector2(7, 1)
		new_pearl.speed *= 1
		add_child(new_pearl)
	if $AnimatedSprite2D.flip_h == false:
		positionPearl.position = Vector2(-7, 1)
		new_pearl.speed *= -1
		add_child(new_pearl)
	new_pearl.global_position = positionPearl.global_position
	$AudioStreamPlayer2D.play()
