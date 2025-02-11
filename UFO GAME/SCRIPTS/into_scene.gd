extends CanvasLayer

func _ready():
	$Splashy/AnimationPlayer.play("splashy_spiral")
	await $Splashy/AnimationPlayer.animation_finished
	$Dialog.show()
	$Dialog/AudioStreamPlayer.play()
	$Button.show()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://SCENE/start_menu.tscn")
