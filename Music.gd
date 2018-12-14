extends AudioStreamPlayer

func fade_in(seconds):
	$Tween.interpolate_property(self, "volume_db", volume_db, 0, seconds, Tween.TRANS_SINE, Tween.EASE_OUT, 0)
	$Tween.start()

func fade_out(seconds):
	$Tween.stop_all()
	$Tween.interpolate_property(self, "volume_db", volume_db, -50, seconds, Tween.TRANS_SINE, Tween.EASE_IN, 0)
	$Tween.start()
