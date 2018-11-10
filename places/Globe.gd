extends TileMap

# Tileset names
var city_tile_names = ["CityBlue", "CityRed"]
var grass_tile_names = ["GrassLight", "GrassMedium", "GrassHeavy"]
var mountain_tile_names = ["Mountain"]
var road_tile_names = ["RoadCenter", "RoadTop", "RoadRight", "RoadBottom", "RoadLeft", "RoadTopBottom", "RoadLeftRight",
	"RoadTopRight", "RoadRightBottom", "RoadBottomLeft", "RoadLeftTop"]

var City = load("res://places/City.tscn")

# Map properties
var tiles = []
var city_tiles = []

# Class to represent a tile on the map
class Tile:
	var tile_name
	var object
	func _init(tile_name, object=null):
		tile_name = tile_name
		object = object

func _ready():
	pass

func init(width, height):
	_create_tiles(width, height)

	for city_tile_name in city_tile_names:
		var new_city = City.instance()

		var newX = randi() % width
		var newY = randi() % height
		while (tiles[newX][newY] != null):
			newX = randi() % width
			newY = randi() % height

		city_tiles.append(set_tile_by_name(newX, newY, city_tile_name, new_city))

	for x in range(width):
		for y in range(height):
			if (not tiles[x][y]):
				var new_tile_name
				# Let's not create too many mountains
				if (randi() % 10 == 1):
					new_tile_name = mountain_tile_names[randi() % mountain_tile_names.size()]
				else:
					new_tile_name = grass_tile_names[randi() % grass_tile_names.size()]
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
