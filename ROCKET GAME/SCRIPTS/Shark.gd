extends Area2D

signal died

#VARIABLES
@export var shark_speed = 200

func _physics_process(delta):
	global_position.x += -shark_speed*delta

func die():
	emit_signal("died")
	queue_free() 


func _on_body_entered(body):
	body.take_damage()
	die()
