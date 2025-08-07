extends CanvasLayer

var left_vector: Vector2 = Vector2.ZERO
var right_vector: Vector2 = Vector2.ZERO
var action_pressed: bool = false

@onready var left_btn: TouchScreenButton = $Control/LeftStick
@onready var right_btn: TouchScreenButton = $Control/RightStick
@onready var action_btn: Button = $Control/Action

func _ready() -> void:
	set_process_unhandled_input(true)
	action_btn.pressed.connect(func(): action_pressed = true)
	action_btn.button_up.connect(func(): action_pressed = false)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenDrag or event is InputEventScreenTouch:
		_update_stick_vectors()

func _process(_delta: float) -> void:
	if action_pressed:
		pass

func _update_stick_vectors() -> void:
	left_vector = _sample_button_vector(left_btn)
	right_vector = _sample_button_vector(right_btn)

func _sample_button_vector(btn: TouchScreenButton) -> Vector2:
	var pos := Vector2.ZERO
	var pressed := false
	for i in range(Input.get_touch_point_count()):
		var id := Input.get_touch_point_index(i)
		var p := Input.get_touch_position(id)
		if btn.get_global_rect().has_point(p):
			pos = p - btn.get_global_rect().get_center()
			pressed = true
			break
	if not pressed:
		return Vector2.ZERO
	var max_radius := max(btn.size.x, btn.size.y) * 0.5
	if max_radius <= 0.0:
		max_radius = 64.0
	return pos.clamped(max_radius) / max_radius

func get_left_vector() -> Vector2:
	return left_vector

func get_right_vector() -> Vector2:
	return right_vector