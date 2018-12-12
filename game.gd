extends Node

var fire_position = 1140
var best_height = 0
var character_dead = false
var start_point = 0

func _ready():
	randomize()
	start_point = $Character.position.y
	$Fire.position.y = fire_position
	$HUD.update_height(0)

func _process(delta):
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
			$HUD.record_time()
			character_dead = true
	else:
		var new_height = int((start_point - $Character.position.y) / 64)
		if new_height > best_height:
			best_height = new_height
			$HUD.update_height(best_height)
