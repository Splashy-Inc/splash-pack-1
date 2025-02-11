extends Node

signal eggs_collected_updated

var eggs_collected := 0

func update_eggs_collected(eggs: int):
	eggs_collected += eggs
	eggs_collected_updated.emit()
