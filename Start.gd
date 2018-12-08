extends Node

func _ready():
	var game_scene = preload("res://Game.tscn").instance()
	add_child(game_scene)
