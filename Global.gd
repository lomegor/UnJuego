extends Node

var current_scene = null

var civilizations = []
var globe

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)

func goto_scene(scene):
	call_deferred('_deferred_goto_scene', scene)

func _deferred_goto_scene(scene):
	current_scene.free()
	current_scene = scene
	get_tree().get_root().add_child(scene)
	get_tree().set_current_scene(scene)
