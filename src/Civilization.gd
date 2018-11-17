extends Node2D

var City = load("res://src/places/City.tscn")

var civilization_name
var cities = []
var type

# A dictionary of the resources that the civilization currenlty has
var resources = {
	'gold': 0,
	'influencePoints': 0
	#...
}
# Dict of cities and the influence of the civilization over them
var influence = {}

func _ready():
	pass

func init(civilization_name, type):
	self.civilization_name = civilization_name
	self.type = type

func add_city(city_name):
	var city = City.instance()
	city.init(city_name, self)
	self.cities.append(city)
