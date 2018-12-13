extends Node2D

export var force = 3000
var jumping = false

func _on_body_entered(body):
	if jumping or not body.has_method("jump_pad_kick"):
		return
	if body.jump_pad_kick(force):
		jumping = true
		$Sprites/AnimationPlayer.play("activate")
		$Sound.play()

func _on_animation_finished(anim_name):
	jumping = false
