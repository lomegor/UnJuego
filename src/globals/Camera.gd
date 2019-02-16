extends Camera2D

const MAX_ZOOM_LEVEL = 0.5
const MIN_ZOOM_LEVEL = 4.0
const ZOOM_INCREMENT = 0.05
const MOVE_INCREMENT = 30

var _current_zoom_level = 1
var _drag = false
var _original_limit_left
var _original_limit_top
var _original_limit_right
var _original_limit_bottom

func _input(event):
	var offset = get_offset()

	if event.is_action_pressed("camera_drag"):
		_drag = true
	elif event.is_action_released("camera_drag"):
		_drag = false
	elif event.is_action("camera_zoom_in"):
		_update_zoom(-ZOOM_INCREMENT, get_local_mouse_position())
	elif event.is_action("camera_zoom_out"):
		_update_zoom(ZOOM_INCREMENT, get_local_mouse_position())
	elif event is InputEventMouseMotion && _drag:
		set_offset(offset - event.relative * _current_zoom_level)
	elif Input.is_action_pressed("camera_left"):
		set_offset(Vector2(offset.x - MOVE_INCREMENT * _current_zoom_level, offset.y))
	elif Input.is_action_pressed("camera_right"):
		set_offset(Vector2(offset.x + MOVE_INCREMENT * _current_zoom_level, offset.y))
	elif Input.is_action_pressed("camera_up"):
		set_offset(Vector2(offset.x, offset.y - MOVE_INCREMENT * _current_zoom_level))
	elif Input.is_action_pressed("camera_down"):
		set_offset(Vector2(offset.x, offset.y + MOVE_INCREMENT * _current_zoom_level))

func _update_zoom(incr, zoom_anchor):
	var old_zoom = _current_zoom_level
	_current_zoom_level += incr
	if _current_zoom_level < MAX_ZOOM_LEVEL:
		_current_zoom_level = MAX_ZOOM_LEVEL
	elif _current_zoom_level > MIN_ZOOM_LEVEL:
		_current_zoom_level = MIN_ZOOM_LEVEL
	if old_zoom == _current_zoom_level:
		return

	var zoom_center = zoom_anchor - get_offset()
	var ratio = 1-_current_zoom_level/old_zoom
	set_offset(get_offset() + zoom_center*ratio)

	set_zoom(Vector2(_current_zoom_level, _current_zoom_level))

	# Adjust limit of camera
	if not _original_limit_left:
		_original_limit_left = limit_left
		_original_limit_top = limit_top
		_original_limit_right = limit_right
		_original_limit_bottom = limit_bottom

	limit_left = _original_limit_left * _current_zoom_level
	limit_top = _original_limit_top * _current_zoom_level
	limit_right = _original_limit_right * _current_zoom_level
	limit_bottom = _original_limit_bottom * _current_zoom_level
