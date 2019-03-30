extends 'res://src/globals/SceneManager.gd'

var Actor = load('res://src/entities/actors/Actor.tscn')
var Civilization = load('res://src/groups/civilizations/Civilization.tscn')
var Region = load('res://src/maps/regions/Region.tscn')
var Entity = load('res://src/entities/Entity.tscn')

# Civilizations in the game
var civilizations = []
# Regions in the game
var regions = []
# Main player
var player
# Entities
var entities = []

func _ready():
	pass

func new_world():
	randomize()

	# Create the character player
	player = Actor.instance()
	player.init('Juan')

	# Initiate regions
	regions.append(Region.instance())
	regions[0].init(30, 17)

	# Create main civilization
	civilizations.append(Civilization.instance())
	civilizations[0].init(regions[0], 'Great Britain', 'red')
	# Add main civilization to player
	civilizations[0].ruler = player

	# Create other civilizations
	civilizations.append(Civilization.instance())
	civilizations[1].init(regions[0], 'France', 'blue')

	# Create entities
	entities.append(Entity.instance())
	regions[0].add_entity(entities[0], Vector2(10,10))
	regions[0].add_entity(player, Vector2(0,2))
