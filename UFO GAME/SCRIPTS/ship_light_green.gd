extends Area2D

signal collected

func _ready() -> void:
	var hud = get_tree().get_nodes_in_group("HUD").front()
	collected.connect(hud._on_egg_collected)
	
	var level = get_tree().get_nodes_in_group("Level").front()
	collected.connect(level._on_egg_collected)

func _on_body_entered(body: Node2D):
	if visible:
		$AudioStreamPlayer.play()
		hide()
		egg_collected()
		await $AudioStreamPlayer.finished
		queue_free()

func egg_collected():
	collected.emit()
