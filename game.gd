extends Node

var fire_position = 1140
var best_height = 0
var character_dead = false
var start_point = 0
var map_end = false

func _ready():
	randomize()
	start_point = $Character.position.y
	$Fire.position.y = fire_position
	$HUD.update_height(0)
	$Music.fade_in(1)

func _process(delta):
	if map_end:
		return

	var velocity = 50
	if $Character.position.y - fire_position < -1000:
		velocity = 600
	elif $Character.position.y - fire_position < -450:
		velocity = 320

	fire_position -= velocity * delta
	$Fire.position.y = fire_position
	$Character.dead_zone = fire_position

	if $Character.dead:
		if not character_dead:
			$HUD.record_time(best_height)
			$Music.fade_out(4)
			character_dead = true
	else:
		var new_height = int((start_point - $Character.position.y) / 64)
		if new_height > best_height:
			best_height = new_height
			$HUD.update_height(best_height)

func _on_map_end():
	map_end = true
	$Fire/AnimationPlayer.play("fade_out")
	$HUD.record_time(best_height)

func _on_fire_finished(anim_name):
	Global.go_to_scene("res://End.tscn")
