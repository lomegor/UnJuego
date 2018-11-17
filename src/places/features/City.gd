extends Sprite

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
	texture = load(_SPRITES[type])
