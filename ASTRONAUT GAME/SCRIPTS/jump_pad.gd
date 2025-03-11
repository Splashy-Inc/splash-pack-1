extends Area2D

@onready var animated_sprite = $AnimatedSprite2D

@export var jump_force = 300 

func _on_body_entered(body):
	if body is Player:
		animated_sprite.play("jump_animation")
		body.jump(jump_force)
		$AudioStreamPlayer2D.play()



func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite.play("idle")
