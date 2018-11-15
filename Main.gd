extends Node

var Civilization = load("res://src/Civilization.tscn")
var City = load("res://src/places/City.tscn")
var Globe = load("res://src/places/Globe.tscn")

func _ready():
	randomize()

	# Crete two civilizations
	Global.civilizations.append(Civilization.instance())	
	Global.civilizations[0].init('Great Britain', 'red')
	Global.civilizations.append(Civilization.instance())	
	Global.civilizations[1].init('France', 'blue')

	var cities = []
	cities.append(City.instance())
	cities[0].init('Capital', Global.civilizations[0].civilization_name)
	cities.append(City.instance())
	cities[1].init('Village', Global.civilizations[1].civilization_name)

	# Initiate map
	Global.globe = Globe.instance()
	Global.globe.init(200, 100, cities)

	# Change to the map scene (probably in a button later)
	Global.goto_scene(Global.globe)

func _process(delta):
	pass
