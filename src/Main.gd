extends Node

func _ready():
	GameState.new_world()

	# Change to the map scene (probably in a button later)
	GameState.goto_scene(GameState.globe)

func _process(delta):
	pass
