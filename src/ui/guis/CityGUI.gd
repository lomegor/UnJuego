extends PanelContainer

signal building_selected

func _ready():
	pass

func init(city):
	find_node('Name').text = city.city_name

func on_building_selected(building):
	emit_signal('building_selected', building)
