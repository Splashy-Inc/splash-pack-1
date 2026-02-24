extends Node

func play():
	if not $AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()

func stop():
	$AudioStreamPlayer.stop()
