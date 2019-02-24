extends Node

var RegionScene = load('res://src/scenes/Region.tscn')

func _ready():
	GameState.new_world()

	# Change to the first region scene scene (probably in a button later)
	var new_scene = RegionScene.instance()
	RegionScene.init(GameState.region[0])
	GameState.goto_scene(RegionScene)

func _process(delta):
	pass
