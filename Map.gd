extends TileMap

signal map_end

func _on_map_end_body_entered(body):
	if body.name == "Character":
		emit_signal("map_end")
