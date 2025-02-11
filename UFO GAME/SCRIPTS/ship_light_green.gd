extends Area2D




func _on_body_entered(body: Node2D):
	if visible:
		$AudioStreamPlayer.play()
		hide()
		await $AudioStreamPlayer.finished
		queue_free()
