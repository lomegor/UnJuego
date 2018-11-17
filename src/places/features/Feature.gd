extends Area2D

func _ready():
	pass

func _load_texture(path):
	$Sprite.texture = load(path)
	var shape = RectangleShape2D.new()
	shape.extents = $Sprite.texture.get_size()
	$Collision.shape = shape
