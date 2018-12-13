extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var init_time = OS.get_ticks_msec()
var milliscounter
var pause = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	# self.clip_text = true
	pass
	
func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	# Format 'milliscounter' to resemble a stopwatch
	if pause:
		return
	else:
		format_stopwatch()

func _on_HUD_time_finish():
	pause = true
	format_stopwatch()

func format_stopwatch():
	milliscounter = OS.get_ticks_msec() - init_time
	var remainingMillis = milliscounter % 1000
	var seconds = (milliscounter / 1000) % 60
	var minutes = (seconds / 60) % 60
	self.text = "%02d:%02d:%03d" % [minutes, seconds, remainingMillis]