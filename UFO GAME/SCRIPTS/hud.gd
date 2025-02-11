extends Control

@onready var eggs_collected_label: Label = $EggsCollected
var eggs_collected := 0

func set_level_number(value):
	$LevelLable.text = "level: "

func _on_egg_collected():
	eggs_collected += 1
	eggs_collected_label.text = str(eggs_collected)


func _on_pause_pressed() -> void:
	$Pause_menu.pause()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		_on_pause_pressed()

	
