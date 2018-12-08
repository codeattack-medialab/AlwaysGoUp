extends KinematicBody2D

export var move_speed = 600
export var gravity = 80
export var _jump_speed = 1500

var on_floor = true
var on_air_time = 0
var landing = 0
var dead_zone = 100000

var velocity = Vector2()

func _process(delta):
	$Camera.limit_bottom = dead_zone

func _physics_process(delta):
	velocity.x = 0
	velocity.y += gravity

	if Input.is_action_pressed("move_right"):
		velocity.x = move_speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -move_speed

	velocity = move_and_slide(velocity, Vector2(0, -1))

	if is_on_floor():
		if landing > 60:
			$Anim.play("landing")
		on_air_time = 0
		on_floor = true
	else:
		on_air_time += delta
		on_floor = on_air_time < 0.1

	if not on_floor and velocity.y > 0:
		landing += velocity.y * delta
	else:
		landing = 0

	if Input.is_action_just_pressed("jump") and on_floor:
		velocity.y = -_jump_speed
		$JumpSound.play()
		$JumpSound.pitch_scale = rand_range(0.8, 1.1)
		$Anim.play("jump")

func jump_pad_kick(force):
	velocity.y = -force
	$Anim.play("jump")