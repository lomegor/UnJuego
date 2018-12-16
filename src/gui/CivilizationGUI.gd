extends PanelContainer

func _ready():
	pass

func init(civilization):
	find_node('Name').text = civilization.civilization_name
	find_node('Members').text = String(civilization.members.size())
	find_node('Gold').text = String(civilization.resources.gold)
	find_node('Influence').text = String(civilization.resources.influence_points)
