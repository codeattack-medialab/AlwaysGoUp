extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal game_start

func _on_Map1_pressed():
	get_node("CanvasLayer2/ColorRect/AnimationPlayer").play("transicion")
func _to_game():
	Global.go_to_scene("res://Game.tscn")
