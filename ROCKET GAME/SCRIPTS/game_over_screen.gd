extends Control

func set_score(new_score):
	$Panel/SCORE.text = "SCORE: " + str(new_score)


func _on_retry_button_pressed():
	Globals.game_selected.emit(load("res://ROCKET GAME/SCENES/game.tscn"))
