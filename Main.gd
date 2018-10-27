extends Node


var Globe = load("res://places/Globe.tscn")
var globe

var cities = []
var position = []
var turn = 0

func _ready():
	randomize()
	globe = Globe.instance();

	cities.append(Vector2(randi() % 32, randi() % 18))
	cities.append(Vector2(randi() % 32, randi() % 18))
	position.append(cities[0])
	position.append(cities[1])

	globe.set_tile(cities[0], "City1")
	globe.set_tile(cities[1], "City2")

	for x in range(0, 32):
		for y in range(0, 18):
			if (Vector2(x, y) != cities[0] and Vector2(x, y) != cities[1]):
				globe.set_cell(x, y, randi() % 4 + 2)
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
