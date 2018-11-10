extends Node


var Globe = load("res://places/Globe.tscn")
var globe

var position = []
var turn = 0

func _ready():
	randomize()
	globe = Globe.instance();
	globe.init(32, 18)
	add_child(globe)

func _process(delta):
	pass

func _on_TurnButton_pressed():
	var nextTurn = (turn + 1) % 2
	var myPosition = position[turn]
	var theirPosition = position[nextTurn]
	var difference = myPosition - theirPosition
	var newPosition
	var tileName
	var previousTileName = globe.get_tile(myPosition)
	var newPreviousTileName

	if (difference.x != 0):
		if (difference.x < 0):
			newPosition = Vector2(myPosition.x + 1, myPosition.y)
			tileName = "Road5"
			if (previousTileName == "Road4"):
				newPreviousTileName = "Road1"
			elif (previousTileName == "Road8"):
				newPreviousTileName = "Road11"
			else:
				newPreviousTileName = "Road7"
		else:
			newPosition = Vector2(myPosition.x - 1, myPosition.y)
			tileName = "Road3"
			newPreviousTileName = "Road7"
			if (previousTileName == "Road4"):
				newPreviousTileName = "Road9"
			elif (previousTileName == "Road8"):
				newPreviousTileName = "Road10"
			else:
				newPreviousTileName = "Road7"
	elif (difference.y != 0):
		if (difference.y < 0):
			newPosition = Vector2(myPosition.x, myPosition.y + 1)
			tileName = "Road4"
			if (previousTileName == "Road5"):
				newPreviousTileName = "Road9"
			elif (previousTileName == "Road3"):
				newPreviousTileName = "Road10"
			else:
				newPreviousTileName = "Road8"
		else:
			newPosition = Vector2(myPosition.x, myPosition.y - 1)
			tileName = "Road6"
			if (previousTileName == "Road5"):
				newPreviousTileName = "Road9"
			elif (previousTileName == "Road3"):
				newPreviousTileName = "Road10"
			else:
				newPreviousTileName = "Road8"

	if (newPosition):
		if (!previousTileName.begins_with("City")):
			globe.set_tile(myPosition, newPreviousTileName)
		globe.set_tile(newPosition, tileName)
		position[turn] = newPosition
	turn = nextTurn
