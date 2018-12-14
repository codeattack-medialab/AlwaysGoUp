extends Node

func _on_Map1_pressed():
	start_game()

func start_game():
	$CanvasLayer2/ColorRect/AnimationPlayer.play("transicion")
	$Music.fade_out(1)

func _on_animation_finished(anim_name):
	Global.go_to_scene("res://Game.tscn")

func _process(delta):
	if Input.is_action_just_pressed("start") or Input.is_action_just_pressed("jump"):
		start_game()
