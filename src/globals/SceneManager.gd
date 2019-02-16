extends Node

# Current scene for switching
var current_scene = null

# History of scenes
var history = []

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)

func goto_scene(scene, free=true):
	call_deferred('_deferred_goto_scene', scene, free)

func _deferred_goto_scene(scene, free, skip_history=false):
	# Free scene if we need to
	if free:
		current_scene.queue_free()
	else:
		if not skip_history:
			history.append(current_scene)
		# Always remove the scene if we are not freeing it
		get_tree().get_root().remove_child(current_scene)

	current_scene = scene
	get_tree().get_root().add_child(scene)
	get_tree().set_current_scene(scene)

func go_back_scene(free=true):
	if not history.empty():
		# Change scene without adding to history
		call_deferred('_deferred_goto_scene', history.pop_back(), free, true)

func _input(event):
	if event.is_action_pressed("go_back"):
		go_back_scene(false)
