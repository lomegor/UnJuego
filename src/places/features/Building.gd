extends "res://src/places/features/Feature.gd"

enum BUILDING_TYPE { DEFENSE, DIPLOMATIC, ECONOMIC, MILITAR }

# level of the building
var level
# type of the building
var type

# How far along is the building construction
var progress

var description

func _ready():
	pass

func init(texture_path):
	_load_texture(texture_path)

func _on_click():
	pass
