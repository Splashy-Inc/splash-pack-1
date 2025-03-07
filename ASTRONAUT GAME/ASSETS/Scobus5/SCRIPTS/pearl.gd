extends Node2D

signal touched_player

var speed = 300

func _physics_process(delta):
	position.x += speed * delta


func _on_area_2d_body_entered(body):
	if body is Player:
		body.hit()
	_die()

func _on_timer_timeout() -> void:
	_die()
	
func _die():
	queue_free()
