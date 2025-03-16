extends Trap




func _on_activation_area_body_entered(body: Node2D) -> void:
	if body is Player:
		$AnimationPlayer.play("Chomp")
