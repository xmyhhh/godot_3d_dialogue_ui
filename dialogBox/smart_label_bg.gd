@tool
extends Node3D

@onready var origin_offset = Vector3(0, 0, 0)
@export var occlusion_node:Node
@export var igone_shading:bool = false

var min_size = null
var label_pixel_size = null
var init = false

func get_min_aabb():
	return min_size
	
func get_aabb():
	return label_pixel_size

func _process(delta):
	var label_node = get_child(0)
	label_pixel_size = label_node.get_aabb().size / self.pixel_size
	label_pixel_size.x += 60
	label_pixel_size.y += 70
	
	if(init):
		label_pixel_size.x = max(label_pixel_size.x, min_size.x)
		label_pixel_size.y = max(label_pixel_size.y, min_size.y)

	if(igone_shading):
		return
		
	self.texture.width = label_pixel_size.x
	self.texture.height = label_pixel_size.y
	self.material_override.set_shader_parameter("size", label_pixel_size)
	#self.material_override.set_shader_parameter("origin_offset", origin_offset)
	
	if(not init):
		init = true
		min_size = label_pixel_size
		

