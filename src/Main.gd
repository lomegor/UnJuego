extends Node

var Civilization = load("res://src/Civilization.tscn")
var City = load("res://src/places/City.tscn")
var Globe = load("res://src/places/Globe.tscn")

func _ready():
	randomize()

	# Crete two civilizations
	GameState.civilizations.append(Civilization.instance())	
	GameState.civilizations[0].init('Great Britain', 'red')
	GameState.civilizations.append(Civilization.instance())	
	GameState.civilizations[1].init('France', 'blue')

	var cities = []
	cities.append(City.instance())
	cities[0].init('Capital', GameState.civilizations[0].civilization_name)
	cities.append(City.instance())
	cities[1].init('Village', GameState.civilizations[1].civilization_name)

	# Initiate map
	GameState.globe = Globe.instance()
	GameState.globe.init(200, 100, cities)

	# Change to the map scene (probably in a button later)
	GameState.goto_scene(GameState.globe)

func _process(delta):
	pass
