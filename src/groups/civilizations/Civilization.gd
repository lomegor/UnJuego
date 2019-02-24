extends '../Group.gd'

var civilization_name
var ruler setget set_ruler
var type
var members = []
var buildings = []
var region
var influence_area # Matrix of points of influence on each tile or something

# A dictionary of the resources that the civilization currenlty has
var resources = {
	'gold': 50,
	'influence_points': 200
	#...
}

func _ready():
	pass

func init(region, civilization_name, type):
	self.region = region
	self.civilization_name = civilization_name
	self.type = type

func set_ruler(new_ruler):
	ruler = new_ruler
	ruler.civilization = self
	members.append(self.ruler)
