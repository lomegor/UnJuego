extends Node2D

var City = load("res://src/places/City.tscn")

var civilization_name
var city setget set_city,get_city
var ruler setget set_ruler
var members = []
var type

# A dictionary of the resources that the civilization currenlty has
var resources = {
	'gold': 50,
	'influence_points': 200
	#...
}
# Dict of cities and the influence of the civilization over them
var influence = {}

func _ready():
	pass

func init(civilization_name, type):
	self.civilization_name = civilization_name
	self.type = type

func set_city(new_city):
	city = new_city
	city.civilization = self

func get_city():
	return city

func set_ruler(new_ruler):
	ruler = new_ruler
	ruler.civilization = self
	members.append(self.ruler)
