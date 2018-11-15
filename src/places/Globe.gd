extends "res://src/places/GameTileMap.gd"

# Map properties
var city_tiles = []

onready var camera = get_node('Camera')

func _ready():
	var map_limits = get_used_rect()
	# Add a bit of padding to the camera
	camera.limit_left = (map_limits.position.x - 1) * cell_size.x
	camera.limit_top = (map_limits.position.y - 1) * cell_size.y
	camera.limit_right = (map_limits.end.x + 1) * cell_size.x
	camera.limit_bottom = (map_limits.end.y + 1) * cell_size.y

func init(width, height, cities):
	_create_tiles(width, height)

	for city in cities:
		var newX = randi() % width
		var newY = randi() % height
		while (tiles[newX][newY] != null):
			newX = randi() % width
			newY = randi() % height

		city_tiles.append(set_tile_by_name(newX, newY, city.tile_name, city))

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
