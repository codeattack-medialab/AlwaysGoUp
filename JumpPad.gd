extends Node2D

export var force = 3000
var jumping = false

func _on_body_entered(body):
	if jumping or not body.has_method("jump_pad_kick"):
		return
	if body.jump_pad_kick(force):
		jumping = true
		$Sprites/AnimationPlayer.play("activate")
		var sound = "Sounds/Sound%d" % round(rand_range(1, 2))
		get_node(sound).play()

func _on_animation_finished(anim_name):
	jumping = false
