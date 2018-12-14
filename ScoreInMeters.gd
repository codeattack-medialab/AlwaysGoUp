extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

"""
func _process(delta):
	# This code commented bellow is for real quick 
	# testing playing just the HUD.tscn scene with F6 
	
	if Input.is_action_just_pressed("jump"):
		print("traza, detecto el salto")
		self.text = str(int(self.text) + int(rand_range(11,33)))
		#Color(0.902,0.445,0,1)
		$"../../AnimationPlayer".play("height_anim")
"""

func _on_HUD_height_change(new_height):
	self.text = str(new_height)
	$"../../AnimationPlayer".play("height_anim")
