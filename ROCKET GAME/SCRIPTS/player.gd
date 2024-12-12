extends CharacterBody2D

signal took_damage

#VARIABLES 
var speed = 400
var lazer_scene = preload("res://SCENES/lazer.tscn")
@onready var lazer_container = $LazerContainer
@onready var lazer_sound = $LazerSound

#Player Movement
func _physics_process(delta):
	velocity = Vector2(0,0)
	
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	move_and_slide()

#Clamp Player to Play Area
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), screen_size)

#Shoot Lazer
func _process(delta):
	if Input.is_action_just_pressed ("shoot"):
		shoot()

func shoot():
	var lazer_instance = lazer_scene.instantiate()
	lazer_container.add_child(lazer_instance)
	lazer_instance.global_position = global_position
	lazer_instance.global_position.x += 150
	lazer_sound.play()

func take_damage():
	emit_signal("took_damage")

func die():
	queue_free()
	
