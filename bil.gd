@tool
extends Node3D


func _process(delta):

	var cur_cam =  get_viewport().get_camera_3d()

	var all_child = get_children()

	for child in all_child:
		child.get_children()[0].material_override.set_shader_parameter("origin_offset", child.transform.origin + Vector3(0, 0.5, 0))
		print(1)
		
		
#		print(child.transform.origin)
#	look_at(dir, cur_cam.global_transform.basis.y, true)
#
#	var childnode = get_children()[0]
#	childnode.scale.x = self.get_aabb().size.x /5.12  + 0.3
#	childnode.scale.y = self.get_aabb().size.y /2.56 + 0.2
#	var mat = childnode.material_override
#	mat.set_shader_parameter("size", Vector2(childnode.scale.x * 100, childnode.scale.y * 100))

