extends "res://src/places/GameTileMap.gd"

const DEFAULT_WIDTH = 10
const DEFAULT_HEIGHT = 10

var CitySprite = load("res://src/places/features/City.tscn")

var city_name
var civilization
var sprite

func _ready():
	# Hack to start camera in the right position
	# TODO: Find why and fix this
	$Camera.set_offset(Vector2(1, 0))
	pass

func init(city_name, width=DEFAULT_WIDTH, height=DEFAULT_HEIGHT):
	_create_tiles(width, height)

	# Fill with grass
	for x in range(width):
		for y in range(height):
			if (not tiles[x][y]):
				set_tile_by_name(x, y, get_random_tile_name(GRASS_TILE_NAMES))

	self.city_name = city_name
	sprite = CitySprite.instance()
	var type = sprite.TYPES.BLUE if civilization.type == 'blue' else sprite.TYPES.RED
	sprite.init(self, type)

func select():
	GameState.goto_scene(self, false)
