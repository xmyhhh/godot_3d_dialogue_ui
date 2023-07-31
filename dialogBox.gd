@tool
extends Node3D


func _process(delta):
	return
	var cur_cam =  get_viewport().get_camera_3d()
	var all_child = get_children()
	for child in all_child:
		var a = child.origin_offset
		child.origin_offset = child.transform.origin + Vector3(0, 4, 0)
