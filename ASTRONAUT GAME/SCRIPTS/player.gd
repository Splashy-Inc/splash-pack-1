extends CharacterBody2D

class_name Player

signal died

@export var gravity = 400 
@export var speed = 125
var speed_multiplier = 1
var speed_influencers = []
@export var jump_force = 200

@onready var animated_sprite = $AnimatedSprite2D

var active = true

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += gravity * delta
		if velocity.y > 500: 
			velocity.y = 500
		if speed_multiplier < 1:
			velocity.y *= speed_multiplier*1.75
	
	var direction = 0
	
	if active==true:
		if Input.is_action_just_pressed("jump") && is_on_floor():
			jump(jump_force)
		
		direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		animated_sprite.flip_h = direction == -1
	
	velocity.x = direction * speed * speed_multiplier
	move_and_slide()
	var collision = get_last_slide_collision()
	if collision:
		var collider = collision.get_collider()
	
		if collider.has_method("drop"):
			collider.drop()
	
	
	updated_animation(direction)
	
func jump(force):
	AudioPlayer.play_sfx("jump")
	velocity.y = -force
	
func updated_animation(direction):
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
		
	else: 
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
			
func hit():
	died.emit()

func add_speed_influencer(influencer):
	if not influencer in speed_influencers:
		speed_influencers.append(influencer)
	_update_speed_modifier()

func remove_speed_influencer(influencer):
	speed_influencers.erase(influencer)
	_update_speed_modifier()
	
func _update_speed_modifier():
	speed_multiplier = 1
	for influencer in speed_influencers:
		if influencer.boost_multiplier and influencer.boost_multiplier != speed_multiplier:
			speed_multiplier = influencer.boost_multiplier
