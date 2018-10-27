extends TileMap

func _ready():
	pass
	
func get_tile(v):
	return tile_set.tile_get_name(get_cellv(v))

func set_tile(v, tile_name):
	set_cellv(v, tile_set.find_tile_by_name(tile_name))

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass