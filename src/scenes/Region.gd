extends Node2D

var region

func _ready():
	pass

func init(region):
	add_child(region)
	self.region = region
