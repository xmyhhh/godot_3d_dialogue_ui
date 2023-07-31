@tool
extends Label3D


func _process(delta):

	var all_child = get_children()

	for child in all_child:
		var scale  = Vector2(self.get_aabb().size.x /5.12  + 0.3, self.get_aabb().size.y /2.56 + 0.2)
		child.get_children()[0].material_override.set_shader_parameter("size", Vector2(scale.x * 100, scale.y * 100))
		
		
		
#		print(child.transform.origin)
#	look_at(dir, cur_cam.global_transform.basis.y, true)
#
#	var childnode = get_children()[0]
#	childnode.scale.x =
#	childnode.scale.y = 
#	var mat = childnode.material_override
#	
