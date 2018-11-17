extends "res://src/places/GameTileMap.gd"

var CitySprite = load("res://src/places/features/City.tscn")

var city_name
var civilization
var sprite

func _ready():
	pass

func init(city_name, civilization):
	self.city_name = city_name
	self.civilization = civilization
	sprite = CitySprite.instance()
	sprite.load_texture(sprite.TYPES.BLUE if civilization.type == 'blue' else sprite.TYPES.RED)
