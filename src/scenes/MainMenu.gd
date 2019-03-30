extends Node

onready var GameState = get_node('/root/GameState')
var RegionScene = load('res://src/scenes/Region.tscn')

func _ready():
	GameState.new_world()

	# Change to the first region scene (probably in a button later)
	var new_scene = RegionScene.instance()
	new_scene.init(GameState.regions[0])
	GameState.goto_scene(new_scene)

func _process(delta):
	pass
