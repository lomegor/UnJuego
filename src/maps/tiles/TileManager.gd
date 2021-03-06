extends Node2D

# Tileset names
const CITY_TILE_NAMES = ["CityBlue", "CityRed"]
const GRASS_TILE_NAMES = ["GrassLight", "GrassMedium", "GrassHeavy"]
const MOUNTAIN_TILE_NAMES = ["Mountain"]
const ROAD_TILE_NAMES = ["RoadCenter", "RoadTop", "RoadRight", "RoadBottom", "RoadLeft", "RoadTopBottom", "RoadLeftRight",
	"RoadTopRight", "RoadRightBottom", "RoadBottomLeft", "RoadLeftTop"]

# Save Tiles objects
var tiles = []
var tile_map
var selected

# Class to represent a tile on the map
class Tile:
	var tile_name
	var entity

	func _init(tile_name, entity=null):
		self.tile_name = tile_name
		self.entity = entity

func _ready():
	pass

func init(tile_map):
	self.tile_map = tile_map

# Create the matrix of tiles
func create_tile_map(width, height):
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

# Se the tile in x, y with a tile name.
func set_tile_by_name(x, y, tile_name):
	tiles[x][y] = Tile.new(tile_name)
	tile_map.set_cell(x, y, tile_map.tile_set.find_tile_by_name(tile_name))
	return tiles[x][y]

func is_position_in_map(position):
	return position > Vector2(0,0) and position.x < tiles.size() and position.y < tiles[0].size()

func get_position_from_tile_index(position):
	return Vector2(tile_map.cell_size.x * position.x, tile_map.cell_size.y * position.y)

func add_entity(entity, position):
	tiles[position.x][position.y].entity = entity
	tile_map.add_child(entity)
	entity.position = get_position_from_tile_index(position)

# Handle selection of tiles and entites
func handle_select(event, mouse_position):
	var position = tile_map.world_to_map(mouse_position)
	if is_position_in_map(position):
		var tile = tiles[position.x][position.y]
		if selected and not tile.entity :
			handle_unselect(event, tile, position)
		elif tile and tile.entity and tile.entity.select():
			selected = tile

func handle_unselect(event, tile=null, position=null):
	if selected.entity.unselect() and position:
		selected.entity.position = get_position_from_tile_index(position)
		if tile:
			tile.entity = selected.entity
		selected.entity = null
	selected = null
