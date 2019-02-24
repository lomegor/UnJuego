extends TextureButton

func _ready():
	pass

func _on_Building_pressed():
	# Check if it can be selected and all that
	# TODO: IS THIS REALLY THE BEST WAY OF GETTING TO CITYGUI????
	get_node('../../../../CityGUI').on_building_selected(self)
