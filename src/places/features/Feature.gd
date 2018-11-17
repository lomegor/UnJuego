extends Area2D

func _ready():
	pass

func _load_texture(path):
	$Sprite.texture = load(path)
	var shape = RectangleShape2D.new()
	shape.extents = $Sprite.texture.get_size()
	$Collision.shape = shape

func _on_input_event(viewport, event, shape_idx):
	# On mouse up
	if event.is_action("ui_select") and !event.is_pressed():
		_on_click()
