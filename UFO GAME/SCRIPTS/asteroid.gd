extends RigidBody2D

var previous_contacts = 0 

func _process(delta: float) -> void:
	var contacts = get_contact_count()
	if previous_contacts == 0 and contacts > 0:
		play_collision_noise()
	previous_contacts = contacts

func play_collision_noise():
	$AudioStreamPlayer.play()
	
