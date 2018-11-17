extends "res://src/places/features/Feature.gd"

enum TYPES {
	RED,
	BLUE
}

const _SPRITES = {
	RED: "res://src/places/features/images/CityRed.png",
	BLUE: "res://src/places/features/images/CityBlue.png",
}

func _ready():
	pass

func load_texture(type):
	_load_texture(_SPRITES[type])
