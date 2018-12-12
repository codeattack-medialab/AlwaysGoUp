extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _on_HUD_height_change(new_height):
	self.text = str(new_height)
	$"../AnimationPlayer".play("height_anim")
