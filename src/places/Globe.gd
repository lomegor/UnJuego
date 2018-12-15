extends "res://src/places/GameTileMap.gd"

onready var camera = get_node('Camera')

func _ready():
	pass

func init(width, height):
	_create_tiles(width, height)

	# Randomise the map
	for x in range(width):
		for y in range(height):
			if (not tiles[x][y]):
				var new_tile_name
				# Let's not create too many mountains
				if (randi() % 100 == 1):
					new_tile_name = get_random_tile_name(MOUNTAIN_TILE_NAMES)
				else:
					new_tile_name = get_random_tile_name(GRASS_TILE_NAMES)
				set_tile_by_name(x, y, new_tile_name)

	# Add the new cities
	for civilization in GameState.civilizations:
		var newX = randi() % width
		var newY = randi() % height
		civilization.city.sprite.set_position(Vector2(newX * cell_size.x, newY * cell_size.y))
		add_child(civilization.city.sprite)
	
	# Set up the UI
	var player_civilization = GameState.player.civilization
	$GUI/CivilizationGUI.find_node('Name').text = player_civilization.civilization_name
	$GUI/CivilizationGUI.find_node('Members').text = String(player_civilization.members.size())
	$GUI/CivilizationGUI.find_node('Gold').text = String(player_civilization.resources.gold)
	$GUI/CivilizationGUI.find_node('Influence').text = String(player_civilization.resources.influence_points)
