extends CharacterBody3D

@export var move_speed: float = 6.0
@export var acceleration: float = 8.0
@export var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity") as float

var velocity_y: float = 0.0
var ui_node: Node = null

func _ready() -> void:
	ui_node = get_tree().get_root().get_node_or_null("Main/UI")

func _physics_process(delta: float) -> void:
	var input_vec := _get_input_vector()
	var desired_velocity := Vector3.ZERO
	desired_velocity.x = input_vec.x
	desired_velocity.z = input_vec.y
	desired_velocity = desired_velocity.normalized() * move_speed

	var horizontal_velocity := Vector3(velocity.x, 0.0, velocity.z)
	horizontal_velocity = horizontal_velocity.lerp(desired_velocity, clamp(acceleration * delta, 0.0, 1.0))

	if not is_on_floor():
		velocity_y -= gravity * delta
	else:
		velocity_y = 0.0

	velocity.x = horizontal_velocity.x
	velocity.z = horizontal_velocity.z
	velocity.y = velocity_y
	move_and_slide()

	# Rotate to face movement direction
	if horizontal_velocity.length() > 0.05:
		look_at(global_transform.origin + Vector3(horizontal_velocity.x, 0, horizontal_velocity.z), Vector3.UP)

func _get_input_vector() -> Vector2:
	# Prefer mobile UI vector if present
	if ui_node and ui_node.has_method("get_left_vector"):
		var lv: Vector2 = ui_node.call("get_left_vector")
		if lv.length() > 0.05:
			return Vector2(lv.x, lv.y)
	# Fallback to keyboard
	var x := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y := Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return Vector2(x, y)