extends "res://src/SceneManager.gd"

var Being = load("res://src/beings/Being.tscn")
var Civilization = load("res://src/Civilization.tscn")
var City = load("res://src/places/City.tscn")
var Globe = load("res://src/places/Globe.tscn")

# Civilizations in the game
var civilizations = []
# Map for the game
var globe
# Main player
var player

func _ready():
	pass

func new_world():
	randomize()

	# Create the character player
	player = Being.instance()
	player.init('Juan')

	# Create main civilization
	civilizations.append(Civilization.instance())
	civilizations[0].init('Great Britain', 'red')
	civilizations[0].add_city('Capital')
	civilizations[0].add_city('Village')
	# Add main civilization to player
	civilizations[0].add_ruler(player)

	# Create other civilizations
	civilizations.append(Civilization.instance())
	civilizations[1].init('France', 'blue')
	civilizations[1].add_city('Capital')

	# Initiate map
	globe = Globe.instance()
	globe.init(30, 17)
