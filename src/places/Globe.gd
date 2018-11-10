extends TileMap

var GlobeTiles = load("res://src/places/GlobeTiles.tscn").instance()

# Map properties
var tiles = []
var city_tiles = []

onready var camera = get_node('Camera')

# Class to represent a tile on the map
class Tile:
	var tile_name
	var object
	func _init(tile_name, object=null):
		self.tile_name = tile_name
		self.object = object

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
				if (randi() % 10 == 1):
					new_tile_name = GlobeTiles.MOUNTAIN_TILE_NAMES[randi() % GlobeTiles.MOUNTAIN_TILE_NAMES.size()]
				else:
					new_tile_name = GlobeTiles.GRASS_TILE_NAMES[randi() % GlobeTiles.GRASS_TILE_NAMES.size()]
				set_tile_by_name(x, y, new_tile_name)

func _create_tiles(width, height):
	for x in range(width):
		var column = []
		column.resize(height)
		tiles.append(column)
	
func get_tile_name(x, y):
	return tiles[x][y].tile_name

func set_tile_by_name(x, y, tile_name, object=null):
	tiles[x][y] = Tile.new(tile_name, object)
	set_cell(x, y, tile_set.find_tile_by_name(tile_name))
	return tiles[x][y]
