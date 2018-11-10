extends Node

var Civilization = load("res://src/Civilization.tscn")
var City = load("res://src/places/City.tscn")
var Globe = load("res://src/places/Globe.tscn")

var civilizations = []
var globe
var cities = []

func _ready():
	randomize()
	civilizations.append(Civilization.instance())	
	civilizations[0].init('Great Britain', 'red')
	civilizations.append(Civilization.instance())	
	civilizations[1].init('France', 'blue')

	cities.append(City.instance())
	cities[0].init('Capital', civilizations[0].civilization_name)
	cities.append(City.instance())
	cities[1].init('Village', civilizations[1].civilization_name)

	globe = Globe.instance()
	globe.init(32, 18, cities)
	add_child(globe)

func _process(delta):
	pass
