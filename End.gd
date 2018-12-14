extends Node

var scoreline = preload("res://HiScoreItem.tscn")

var visualnodes_list = Array()



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	"""
	Global.scores.append({name = 'AAA', meters = 275, ms = 96000})
	Global.scores.append({name = 'BBB', meters = 275, ms = 99000})
	Global.scores.append({name = 'CCC', meters = 205, ms = 90000})
	Global.scores.append({name = 'DDD', meters = 185, ms = 83400})
	Global.scores.append({name = 'EEE', meters = 185, ms = 85800})
	Global.scores.append({name = 'FFF', meters = 153, ms = 82123})
	Global.scores.append({name = 'GGG', meters = 113, ms = 71400})
	Global.scores.append({name = 'HHH', meters = 102, ms = 68000})
	Global.scores.append({name = 'III', meters = 0, ms = 51000})
	Global.scores.append({name = 'JIJI-JAJA', meters = 320, ms = 139900})
	"""
	Global.scores.append({name = "", meters = Global.current_score.meters, ms = Global.current_score.ms})
	Global.scores.sort_custom(self, "sort_scores")
	draw_list()

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	$Camera2D.position.y -= 75 * delta
	if Input.is_action_just_pressed("start") or Input.is_action_just_pressed("jump"):
		Global.go_to_scene("res://Start.tscn")
		

func draw_list():
	var nloops
	visualnodes_list = $CanvasLayer/Control/VBoxContainer.get_children()
	if Global.scores.size() >= visualnodes_list.size():
		nloops = visualnodes_list.size()
	else:
		nloops = Global.scores.size()
	for n in range(0, nloops):
		var label_item1 = visualnodes_list[n].get_node("ScoreLine/NameLabel")
		# la siguiente asignación debería ser con el Global.scores[n].name en el futuro
		label_item1.text = "#" + str(n+1)
		var label_item2 = visualnodes_list[n].get_node("ScoreLine/MetersLabel")
		label_item2.text = str(Global.scores[n].meters)
		var label_item3 = visualnodes_list[n].get_node("ScoreLine/UnitsLabel")
		var label_item4 = visualnodes_list[n].get_node("ScoreLine/TimeLabel")
		label_item4.text = format_ms(Global.scores[n].ms)
		animate_position(visualnodes_list[n], Vector2(visualnodes_list[n].rect_position.x, 1300), visualnodes_list[n].rect_position)		
		#yield($TweenPosition, "tween_completed")
		if str(Global.current_score.meters) == label_item2.text and format_ms(Global.current_score.ms) == label_item4.text:
			animate_color(label_item1, label_item2, label_item3, label_item4, Color(0.73,0.09,0.09,1), Color(1,1,1,1))
		
		

func animate_color(label1, label2, label3, label4, start, end):
	yield($TweenPosition, "tween_completed")
	$TweenColor.interpolate_property(label1, "custom_colors/font_color", start, end, 1.25, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$TweenColor.interpolate_property(label2, "custom_colors/font_color", start, end, 1.25, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$TweenColor.interpolate_property(label3, "custom_colors/font_color", start, end, 1.25, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$TweenColor.interpolate_property(label4, "custom_colors/font_color", start, end, 1.25, Tween.TRANS_SINE, Tween.EASE_IN_OUT)	
	$TweenColor.start()

func animate_position(item, start, end):
	$TweenPosition.interpolate_property(item, "rect_position", start, end, 0.75, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$TweenPosition.start()
	item.show()
	
	
func format_ms(millis):
	var remainingMillis = millis % 1000
	var seconds = (millis / 1000) % 60
	var minutes = (millis / (1000 * 60)) # % 60
	return ("%02d:%02d:%03d" % [minutes, seconds, remainingMillis])
	

static func sort_scores(a, b):
	if a.meters > b.meters:
		return true
	elif a.meters == b.meters:
		if a.ms <= b.ms:
			return true
		else:
			return false
	else:
		return false
