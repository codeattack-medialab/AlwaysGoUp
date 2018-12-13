extends CanvasLayer

signal height_change(height)
signal time_finish(best_score)

func update_height(new_height):
	self.emit_signal("height_change", new_height)

func record_time(best_score):
	self.emit_signal("time_finish", best_score)