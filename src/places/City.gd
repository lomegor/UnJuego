extends "res://src/places/GameTileMap.gd"

var city_name
var colour
var tile_name

func _ready():
	pass

func init(city_name, colour):
	self.city_name = city_name
	self.colour = colour
	if (colour == 'blue'):
		self.tile_name = CITY_TILE_NAMES[0]
	else:
		self.tile_name = CITY_TILE_NAMES[1]
