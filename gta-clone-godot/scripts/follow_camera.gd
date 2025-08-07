extends Node3D

@export var target_path: NodePath
@export var distance: float = 6.0
@export var height: float = 3.0
@export var smoothing: float = 10.0

var camera: Camera3D
var target: Node3D

func _ready() -> void:
	camera = get_node_or_null("Camera3D")
	if camera == null:
		camera = Camera3D.new()
		add_child(camera)
	camera.current = true
	if target_path != NodePath(""):
		target = get_node_or_null(target_path) as Node3D

func _process(delta: float) -> void:
	var desired_origin := Vector3.ZERO
	if target:
		desired_origin = target.global_transform.origin
	var desired_pos := desired_origin + Vector3.BACK * distance + Vector3.UP * height
	global_transform.origin = global_transform.origin.lerp(desired_pos, clamp(smoothing * delta, 0.0, 1.0))
	look_at(desired_origin, Vector3.UP)