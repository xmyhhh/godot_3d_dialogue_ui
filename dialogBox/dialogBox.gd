
extends Node3D
@export var top:Node
@export var center:Node 
@export var buttom:Node 

var center_init_size
var top_init_pos
var buttom_init_pos
var init = false

func _process(delta):
	if(top && center && buttom):
		if(not init):
			init = true
			center_init_size = center.get_child(0).get_aabb().size
			top_init_pos = top.transform.origin
			buttom_init_pos = buttom.transform.origin
			return
			
		var y_change =  (center.get_child(0).get_aabb().size.y - center_init_size.y)  / 2.0
		var x_change =  (center.get_child(0).get_aabb().size.x - center_init_size.x)  / 2.0
		top.transform.origin.y = top_init_pos.y + y_change
		buttom.transform.origin.y = buttom_init_pos.y - y_change
		top.transform.origin.x = top_init_pos.x - x_change
		buttom.transform.origin.x = buttom_init_pos.x + x_change
