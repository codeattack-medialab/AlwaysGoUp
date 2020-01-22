extends Node

var platform_name : String
var touchscreen : bool
var virtual_keyboard : bool
var current_scene
var scores = Array()
var current_score = {meters = 0, ms = 0}

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	init_platform_info()


func init_platform_info():
	platform_name = OS.get_name()
	touchscreen = OS.has_touchscreen_ui_hint()
	virtual_keyboard = OS.has_virtual_keyboard()
	if OS.is_debug_build():
		print ("Platform: " + platform_name)
		print ("Has touchscreen capabities: " + touchscreen as String)
		print ("Has virtual keyboard: " + virtual_keyboard as String)


func go_to_scene(new_scene):
	call_deferred("_deferred_go_to_scene", new_scene)

func _deferred_go_to_scene(new_scene):
	current_scene.free()
	current_scene = load(new_scene).instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
