extends '../Entity.gd'


# Name for the entity
var entity_name
# Class and level
var entity_class
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
# What the entity is currently doing (could be an enum, like fighting, leading, partying...)
var currentActivity


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func init(entity_name):
	self.entity_name = entity_name
