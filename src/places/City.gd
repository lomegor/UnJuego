extends TileMap

var GlobeTiles = load("res://src/places/GlobeTiles.tscn").instance()

var city_name
var colour
var tile_name

func _ready():
	pass

func init(city_name, colour):
	self.city_name = city_name
	self.colour = colour
	if (colour == 'blue'):
		self.tile_name = GlobeTiles.CITY_TILE_NAMES[0]
	else:
		self.tile_name = GlobeTiles.CITY_TILE_NAMES[1]

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
