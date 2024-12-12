extends RigidBody2D

func _on_body_entered(body: Node) -> void:
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimationPlayer.play("swingopen")
	await $AnimationPlayer.animation_finished
	$CollisionShape2D.set_deferred("disabled", false)

func _on_timer_timeout() -> void:
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimationPlayer.play("swingopen")
	await $AnimationPlayer.animation_finished
	$CollisionShape2D.set_deferred("disabled", false)
	$AnimationPlayer.play("idle")
