extends Node

var Civilization = load("res://src/Civilization.tscn")
var City = load("res://src/places/City.tscn")
var Globe = load("res://src/places/Globe.tscn")

func _ready():
	randomize()

	# Crete two civilizations
	GameState.civilizations.append(Civilization.instance())	
	GameState.civilizations[0].init('Great Britain', 'red')
	GameState.civilizations[0].add_city('Capital')
	GameState.civilizations[0].add_city('Village')
	GameState.civilizations.append(Civilization.instance())	
	GameState.civilizations[1].init('France', 'blue')
	GameState.civilizations[1].add_city('Capital')

	# Initiate map
	GameState.globe = Globe.instance()
	GameState.globe.init(30, 17)

	# Change to the map scene (probably in a button later)
	GameState.goto_scene(GameState.globe)

func _process(delta):
	pass
