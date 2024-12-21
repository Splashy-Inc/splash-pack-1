extends RigidBody2D

func _process(delta: float) -> void:
	if get_contact_count() > 0:
		drop()

func drop() -> void:
	if $Timer.is_stopped():
		$Timer.start()

func _on_timer_timeout() -> void:
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimationPlayer.play("swingopen")
	await $AnimationPlayer.animation_finished
	$CollisionShape2D.set_deferred("disabled", false)
	$AnimationPlayer.play("idle")
