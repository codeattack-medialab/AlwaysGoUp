extends CanvasLayer

signal height_change(height)
signal time_finish()

func update_height(new_height):
	self.emit_signal("height_change", new_height)

func record_time():
	self.emit_signal("time_finish")