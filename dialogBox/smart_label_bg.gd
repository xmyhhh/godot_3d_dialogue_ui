@tool
extends Node3D

@onready var origin_offset = Vector3(0, 0, 0)

func _process(delta):
	origin_offset = transform.origin + Vector3(0, 2, 0)
	var label_node = get_child(0)
	var label_pixel_size = label_node.get_aabb().size / self.pixel_size
	label_pixel_size.x += 60
	label_pixel_size.y += 60
	self.texture.width = label_pixel_size.x
	self.texture.height = label_pixel_size.y
	self.material_override.set_shader_parameter("size", label_pixel_size)
	self.material_override.set_shader_parameter("origin_offset", origin_offset)
	var cur_cam = get_tree().get_root().get_viewport().get_camera_3d()
	if(cur_cam != null):
		var MODEL_MATRIX = global_transform
		var VIEW_MATRIX = cur_cam.global_transform
		var offset_dir = origin_offset * MODEL_MATRIX - Vector3(0, 0, 0) * MODEL_MATRIX
		label_node.global_transform.origin = global_transform.origin - offset_dir ;
		label_node.global_transform.origin =  ( label_node.global_transform.origin * VIEW_MATRIX + Vector3(origin_offset.x, origin_offset.y,  -0.1)) * VIEW_MATRIX.inverse() 

