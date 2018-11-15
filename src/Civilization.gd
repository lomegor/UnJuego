extends Node2D

var civilization_name
var colour

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

func init(civilization_name, colour):
	civilization_name = civilization_name
	colour = colour

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
