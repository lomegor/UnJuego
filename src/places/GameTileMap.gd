extends TileMap

# Tileset names
const CITY_TILE_NAMES = ["CityBlue", "CityRed"]
const GRASS_TILE_NAMES = ["GrassLight", "GrassMedium", "GrassHeavy"]
const MOUNTAIN_TILE_NAMES = ["Mountain"]
const ROAD_TILE_NAMES = ["RoadCenter", "RoadTop", "RoadRight", "RoadBottom", "RoadLeft", "RoadTopBottom", "RoadLeftRight",
	"RoadTopRight", "RoadRightBottom", "RoadBottomLeft", "RoadLeftTop"]

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
	pass

func _create_tiles(width, height):
	for x in range(width):
		var column = []
		column.resize(height)
		tiles.append(column)

func get_random_tile_name(list):
	return list[randi() % list.size()]
	
func get_tile_name(x, y):
	return tiles[x][y].tile_name

func set_tile_by_name(x, y, tile_name, object=null):
	tiles[x][y] = Tile.new(tile_name, object)
	set_cell(x, y, tile_set.find_tile_by_name(tile_name))
	return tiles[x][y]
