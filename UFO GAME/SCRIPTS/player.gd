extends CharacterBody2D
class_name Player

@onready var animated_sprite = $AnimatedSprite2D

var force = 500
var active = true
@export var start: StaticBody2D

func _ready(): 
	$AnimationPlayer.play("grow")


#Player Controls  
func _physics_process(delta):
	if active == true:
		if Input.is_action_pressed("move_right"):
			velocity += Vector2(force * delta, 0)
		if Input.is_action_pressed("move_left"):
			velocity += Vector2(-force * delta, 0)
		if Input.is_action_pressed("move_up"):
			velocity += Vector2(0, -force * delta)
		if Input.is_action_pressed("move_down"):
			velocity += Vector2(0, force * delta)
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider is RigidBody2D:
			collider.apply_impulse(velocity/2)
			velocity = velocity/2
		else:
			velocity = velocity.slide(collision.get_normal())
	
func freeze():
	active = false
	velocity = Vector2.ZERO
	# CODE TO SLOWLY ROTATATE SHIP

func reset():
	$HurtSFX.play()
	velocity = Vector2.ZERO
	active = false
	await $HurtSFX.finished
	get_tree().reload_current_scene()
	
func shrink():
	freeze()
	$AnimationPlayer.play("shrink")
	
