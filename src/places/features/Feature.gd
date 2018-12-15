extends Area2D

func _ready():
	pass

func _load_texture(path):
	# Load the texture
	$Sprite.texture = load(path)

	# Set the collision box
	var shape = RectangleShape2D.new()
	var size = $Sprite.texture.get_size()
	shape.extents = size
	$Collision.shape = shape

	# Add a highlighting square
	$Square.points = [Vector2(0, 0), Vector2(size.x, 0), Vector2(size.x, size.y), Vector2(0, size.y), Vector2(0, 0)]

	# Move the description node
	$Description.margin_left = size.x
	$Description.margin_right = size.x + $Description.margin_right

func _on_input_event(viewport, event, shape_idx):
	# On mouse up
	if event.is_action("ui_select") and !event.is_pressed():
		_on_click()


func _on_mouse_entered():
	# TODO: Change cursor?
	modulate = Color(1, 1, 1, .7)
	$Square.visible = true

	# Show description if we have one
	if self.description:
		$Description.text = self.description
		$Description.visible = true

func _on_mouse_exited():
	modulate = Color(1, 1, 1, 1)
	$Square.visible = false
	$Description.visible = false

func set_position(position):
	# Needed because setting a property with an equal sign calles the parent setter
	self.position = position
