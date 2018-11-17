extends Area2D

func _ready():
	pass

func _load_texture(path):
	$Sprite.texture = load(path)
	var shape = RectangleShape2D.new()
	var size = $Sprite.texture.get_size()
	shape.extents = size
	$Collision.shape = shape
	$Square.points = [Vector2(0, 0), Vector2(size.x, 0), Vector2(size.x, size.y), Vector2(0, size.y), Vector2(0, 0)]

func _on_input_event(viewport, event, shape_idx):
	# On mouse up
	if event.is_action("ui_select") and !event.is_pressed():
		_on_click()


func _on_mouse_entered():
	# TODO: Change cursor?
	modulate = Color(1, 1, 1, .7)
	$Square.visible = true

func _on_mouse_exited():
	modulate = Color(1, 1, 1, 1)
	$Square.visible = false
