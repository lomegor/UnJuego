extends "res://src/places/features/Feature.gd"

enum TYPES {
	RED,
	BLUE
}

const _SPRITES = {
	RED: "res://src/places/features/images/CityRed.png",
	BLUE: "res://src/places/features/images/CityBlue.png",
}

var city

func _ready():
	pass

func init(city, type):
	self.city = city
	_load_texture(_SPRITES[type])

func _on_click():
	city.select()
