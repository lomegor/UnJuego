extends Node2D

func _ready():
	# Duplicate material so entities don't use the same one
	var new_material = $Sprite.get_material().duplicate(true)
	$Sprite.set_material(new_material)
	set_shader_param('outlineSize', 0)


func load_texture(path):
	$Sprite.texture = load(path)

func set_shader_param(parameter, value):
	$Sprite.material.set_shader_param(parameter, value)

# Should be overriden by the parent
func select():
	pass

func unselect():
	pass
