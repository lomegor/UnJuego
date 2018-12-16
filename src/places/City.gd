extends "res://src/places/GameTileMap.gd"

const DEFAULT_WIDTH = 10
const DEFAULT_HEIGHT = 10

var CitySprite = load("res://src/places/features/City.tscn")
var Building = load("res://src/places/features/Building.tscn")

var city_name
var civilization
var sprite
var mouse_sprite
var buildings = []

func _ready():
	# Move map to account for GUI
	$Camera.limit_left -= $GUI/CityGUI.rect_size.x
	# TODO: Fix camera position, no idea why is needed
	$Camera.set_offset(Vector2(1, 0))

func _process(delta):
	if mouse_sprite:
		mouse_sprite.offset = get_global_mouse_position()
		# Limit the sprites to tiles

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

	$GUI/CityGUI.init(self)

func select():
	GameState.goto_scene(self, false)

func _on_building_selected(building):
	# TODO: add sprite on canvas layer or something to be on top of GUI
	mouse_sprite = Sprite.new()
	mouse_sprite.texture = building.texture_normal
	add_child(mouse_sprite)

func _input(event):
	if mouse_sprite and event.is_action_pressed('ui_select'):
		var tile_position = world_to_map(get_global_mouse_position())

		# TODO: check if building can be created
		var building = Building.instance()
		building.init(mouse_sprite.texture.resource_path)
		building.set_position(Vector2(tile_position.x * cell_size.x, tile_position.y * cell_size.y))
		buildings.append(building)
		add_child(building)
