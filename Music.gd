extends AudioStreamPlayer

func fade_in():
	$Tween.interpolate_property(self, "volume_db", volume_db, 0, 2, Tween.TRANS_SINE, Tween.EASE_OUT, 0)
	$Tween.start()

func fade_out():
	$Tween.stop_all()
	$Tween.interpolate_property(self, "volume_db", volume_db, -50, 4, Tween.TRANS_SINE, Tween.EASE_IN, 0)
	$Tween.start()
