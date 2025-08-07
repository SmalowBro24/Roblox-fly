extends Node3D

@export var blocks_x: int = 6
@export var blocks_z: int = 6
@export var block_size: float = 12.0
@export var building_min_h: float = 3.0
@export var building_max_h: float = 12.0

func _ready() -> void:
	randomize()
	for x in range(blocks_x):
		for z in range(blocks_z):
			if (x + z) % 3 == 0:
				continue
			var h := randf_range(building_min_h, building_max_h)
			var mesh := BoxMesh.new()
			mesh.size = Vector3(block_size * 0.8, h, block_size * 0.8)
			var mi := MeshInstance3D.new()
			mi.mesh = mesh
			var mat := StandardMaterial3D.new()
			var hue := randf()
			mat.albedo_color = Color.from_hsv(hue, 0.25, 0.8)
			mat.roughness = 0.85
			mat.metallic = 0.0
			mi.material_override = mat
			add_child(mi)
			mi.translation = Vector3((x - blocks_x / 2.0) * block_size, h / 2.0, (z - blocks_z / 2.0) * block_size)