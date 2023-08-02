
extends Node3D

@export var top_node:Node
@export var center_node:Node 
@export var buttom_node:Node 
@export var reposition = false

var self_init_pos
var center_init_size
var top_init_pos
var buttom_init_pos
var init = false

var top_text_node
var center_text_node
var buttom_text_node

func _process(delta):
	if(top_node && center_node && buttom_node):
		if(not init):
			init = true
			top_text_node = top_node.get_child(0)
			center_text_node = center_node.get_child(0)
			buttom_text_node = buttom_node.get_child(0)
			self_init_pos = self.transform.origin
			center_init_size = center_text_node.get_aabb().size
			top_init_pos = top_node.transform.origin
			buttom_init_pos = buttom_node.transform.origin
			
			return
		if(reposition):
			var y_change =  (center_text_node.get_aabb().size.y - center_init_size.y)  / 2.0
			var x_change =  (center_text_node.get_aabb().size.x - center_init_size.x)  / 2.0
			top_node.transform.origin.y = top_init_pos.y + y_change
			buttom_node.transform.origin.y = buttom_init_pos.y - y_change
			top_node.transform.origin.x = top_init_pos.x - x_change
			buttom_node.transform.origin.x = buttom_init_pos.x + x_change
			self.transform.origin.y = self_init_pos.y + y_change

func set_top(content):
	pass
