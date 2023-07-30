
extends Label3D

func _process(delta):
	pass
	var cur_cam =  get_tree().get_root().get_viewport().get_camera_3d() 
	var dir = cur_cam.global_transform.origin 
	look_at(dir, cur_cam.global_transform.basis.y, true)
#
#	var childnode = get_children()[0]
#	childnode.scale.x = self.get_aabb().size.x /5.12  + 0.3
#	childnode.scale.y = self.get_aabb().size.y /2.56 + 0.2
#	var mat = childnode.material_override
#	mat.set_shader_parameter("size", Vector2(childnode.scale.x * 100, childnode.scale.y * 100))

