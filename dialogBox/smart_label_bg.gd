@tool
extends Node3D

@onready var origin_offset = Vector3(0, 0, 0)
@export var occlusion_node:Node
@export var igone_shading:bool = false

var min_size = null
var init = false

func get_min_aabb():
	if(init):
		return min_size
	else:
		return null

func _process(delta):
	origin_offset = transform.origin + Vector3(0, 2, 0)
	var label_node = get_child(0)
	var label_pixel_size = label_node.get_aabb().size / self.pixel_size
	label_pixel_size.x += 60
	label_pixel_size.y += 60
	if(init):
		label_pixel_size.x = max(label_pixel_size.x, min_size.x)
		label_pixel_size.y = max(label_pixel_size.y, min_size.y)
		
				
	if(igone_shading):
		return
		
	self.texture.width = label_pixel_size.x
	self.texture.height = label_pixel_size.y
	self.material_override.set_shader_parameter("size", label_pixel_size)
	self.material_override.set_shader_parameter("origin_offset", origin_offset)
	
	if(not init):
		init = true
		min_size = label_pixel_size
		
	var cur_cam = get_tree().get_root().get_viewport().get_camera_3d()
	if(cur_cam != null):
		var MODEL_MATRIX = global_transform
		var VIEW_MATRIX = cur_cam.global_transform
		var offset_dir = origin_offset * MODEL_MATRIX - Vector3(0, 0, 0) * MODEL_MATRIX
#
		label_node.global_transform.origin = global_transform.origin - offset_dir ;
		
		label_node.global_transform.origin =  ( label_node.global_transform.origin * VIEW_MATRIX + Vector3(origin_offset.x, origin_offset.y,  0.0)) * VIEW_MATRIX.inverse() 

	if(occlusion_node != null):
		occlusion_node.texture.width = label_pixel_size.x
		occlusion_node.texture.height = label_pixel_size.y
		occlusion_node.material_override.set_shader_parameter("size", label_pixel_size)
		occlusion_node.material_override.set_shader_parameter("origin_offset", origin_offset)
