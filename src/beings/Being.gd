extends Node2D


# Name for the being
var being_name
# Class and level
var being_class
var level
# Civilization that it belongs to
var civilization
# Relationships with other persons
var relationships = {}

# Current skill points
var skills = {
	'life': 0,
	'damage': 0,
	'intimidation': 0,
	'building': 0,
	'accuracy': 0,
	'evasion': 0,
	'crafting': 0,
	'administration': 0,
	'persusation': 0,
	'spellDamage': 0,
	'research': 0,
	'collaboration': 0,
	'charm': 0,
	'leadership': 0,
	'mana': 0
}
# What the being is currently doing (could be an enum, like fighting, leading, partying...)
var currentActivity

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func init(being_name):
	self.being_name = being_name
