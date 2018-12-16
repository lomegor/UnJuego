extends TileMap

# Tileset names
const CITY_TILE_NAMES = ["CityBlue", "CityRed"]
const GRASS_TILE_NAMES = ["GrassLight", "GrassMedium", "GrassHeavy"]
const MOUNTAIN_TILE_NAMES = ["Mountain"]
const ROAD_TILE_NAMES = ["RoadCenter", "RoadTop", "RoadRight", "RoadBottom", "RoadLeft", "RoadTopBottom", "RoadLeftRight",
	"RoadTopRight", "RoadRightBottom", "RoadBottomLeft", "RoadLeftTop"]

var Camera = load("res://src/helpers/Camera.tscn")

# Class to represent a tile on the map
class Tile:
	var tile_name
	var object

	func _init(tile_name, object=null):
		self.tile_name = tile_name
		self.object = object

# Save Tiles objects
var tiles = []

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

# Create the array for tiles
func _create_tiles(width, height):
	for x in range(width):
		var column = []
		column.resize(height)
		tiles.append(column)

# Return a random name from the list
func get_random_tile_name(list):
	return list[randi() % list.size()]

# Get the tile in position x, y
func get_tile(x, y):
	return tiles[x][y]

# Get the tile name of the tile in x, y
func get_tile_name(x, y):
	return tiles[x][y].tile_name

# Se the tile in x, y with a tile name
func set_tile_by_name(x, y, tile_name, object=null):
	tiles[x][y] = Tile.new(tile_name, object)
	set_cell(x, y, tile_set.find_tile_by_name(tile_name))
	return tiles[x][y]
