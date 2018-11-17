extends "res://src/places/GameTileMap.gd"

onready var camera = get_node('Camera')

func _ready():
	# Set up the camera and add a bit of padding to the camera
	var map_limits = get_used_rect()
	camera.limit_left = (map_limits.position.x - 1) * cell_size.x
	camera.limit_top = (map_limits.position.y - 1) * cell_size.y
	camera.limit_right = (map_limits.end.x + 1) * cell_size.x
	camera.limit_bottom = (map_limits.end.y + 1) * cell_size.y

func init(width, height):
	_create_tiles(width, height)

	# Randomise the rest of the map
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
		for city in civilization.cities:
			var newX = randi() % width
			var newY = randi() % height
			city.sprite.position = Vector2(newX * cell_size.x, newY * cell_size.y)
			add_child(city.sprite)
