extends Node

var fire_position = 1140

func _ready():
	randomize()
	$Fire.position.y = fire_position

func _process(delta):
	var velocity = 50
	if $Character.position.y - fire_position < -1000:
		velocity = 600
	elif $Character.position.y - fire_position < -450:
		velocity = 320

	fire_position -= velocity * delta
	$Fire.position.y = fire_position
	$Character.dead_zone = fire_position
