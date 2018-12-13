extends Node

var scoreline = preload("res://HiScoreItem.tscn")
var metres = [275,275,205,185,185,153,113,102,88]

var visualnodes_list = Array()



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	Global.scores.append({name = 'AAA', meters = 275, ms = 96000})
	Global.scores.append({name = 'BBB', meters = 275, ms = 99000})
	Global.scores.append({name = 'CCC', meters = 205, ms = 90000})
	Global.scores.append({name = 'DDD', meters = 185, ms = 83400})
	Global.scores.append({name = 'EEE', meters = 185, ms = 85800})
	Global.scores.append({name = 'FFF', meters = 153, ms = 82123})
	Global.scores.append({name = 'GGG', meters = 113, ms = 71400})
	Global.scores.append({name = 'HHH', meters = 102, ms = 68000})
	Global.scores.append({name = 'III', meters = 88, ms = 51000})
	Global.scores.append({name = 'JIJI-JAJA', meters = 320, ms = 139900})
	###
	Global.scores.append({name = 'FRA', meters = 275, ms = 95000})
	Global.scores.sort_custom(self, "sort_scores")
	draw_list()
	"""
	for s in Global.scores:
		print (s)
	"""

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	$Camera2D.position.y -= 75 * delta
	if Input.is_action_just_pressed("start") or Input.is_action_just_pressed("jump"):
		Global.go_to_scene("res://Start.tscn")
		

func draw_list():
	var nloops
	visualnodes_list = $CanvasLayer/Control/VBoxContainer.get_children()
	print(visualnodes_list.size())
	if Global.scores.size() >= visualnodes_list.size():
		nloops = visualnodes_list.size()
	else:
		nloops = Global.scores.size()
	for n in range(0, nloops):
		var label_item = visualnodes_list[n].get_node("ScoreLine/NameLabel")
		label_item.text = Global.scores[n].name
		label_item = visualnodes_list[n].get_node("ScoreLine/MetersLabel")
		label_item.text = str(Global.scores[n].meters)
		label_item = visualnodes_list[n].get_node("ScoreLine/TimeLabel")
		label_item.text = format_ms(Global.scores[n].ms)
		visualnodes_list[n].show()
		

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
