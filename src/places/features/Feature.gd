extends Area2D

func _ready():
	pass

func _load_texture(path):
	$Sprite.texture = load(path)
	var shape = RectangleShape2D.new()
	shape.extents = $Sprite.texture.get_size()
	$Collision.shape = shape

func _on_input_event(viewport, event, shape_idx):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		_on_click()
