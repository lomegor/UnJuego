extends TileMap

var Camera = load('res://src/globals/Camera.tscn')
var TileManager = load('res://src/maps/tiles/TileManager.tscn')
var tile_manager

func _ready():
	# Set up the camera and add a bit of padding to the camera
	var camera = Camera.instance()
	camera.current = true
	var map_limits = get_used_rect()
	camera.limit_left = (map_limits.position.x - 1) * cell_size.x
	camera.limit_top = (map_limits.position.y - 1) * cell_size.y
	camera.limit_right = (map_limits.end.x + 1) * cell_size.x
	camera.limit_bottom = (map_limits.end.y + 1) * cell_size.y
	add_child(camera)

func init(width, height):
	tile_manager = TileManager.instance()

	tile_manager.create_tile_map(width, height)

	# Randomise the map
	for x in range(width):
		for y in range(height):
			if (not tile_manager.tiles[x][y]):
				var new_tile_name
				# Let's not create too many mountains
				if (randi() % 100 == 1):
					new_tile_name = tile_manager.get_random_tile_name(tile_manager.MOUNTAIN_TILE_NAMES)
				else:
					new_tile_name = tile_manager.get_random_tile_name(tile_manager.GRASS_TILE_NAMES)
				tile_manager.set_tile_by_name(x, y, new_tile_name, self)
