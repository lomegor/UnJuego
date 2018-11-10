extends Node2D

enum BUILDING_TYPE { DEFENSE, DIPLOMATIC, ECONOMIC, MILITAR }

# level of the building
var level
# type of the building
var type

# How far along is the building construction
var progress

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
