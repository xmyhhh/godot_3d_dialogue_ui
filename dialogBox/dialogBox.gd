
extends Node3D

@export var top_node:Node
@export var center_node:Node 
@export var buttom_node:Node 

@export var reposition = false
@export var buttom_as_reposition_origin = true

@export var top_text_max_char:int = 8
@export var center_text_max_char:int = 35
@export var buttom_text_max_char:int = 4

@export var top_text_reach_max_hide:bool = true
@export var center_text_reach_max_hide:bool = true
@export var buttom_text_reach_max_hide:bool = true

@export var center_text_reach_max_auto_scroll:bool = true

@export var auto_scroll_speed:float = 2.0
@export var auto_scroll_duration:float = 2.0

#align
var self_init_pos
var center_init_size
var top_init_pos
var buttom_init_pos
var init = false

var top_text_node
var center_text_node
var buttom_text_node

#text arrage
var dialog_content = {
	"top": "",
	"center": "",
	"buttom": ""
}

func _process(delta):
	await get_tree().process_frame
	if(top_node && center_node && buttom_node):
		if(not init):
			init = true
			top_text_node = top_node.get_child(0)
			center_text_node = center_node.get_child(0)
			buttom_text_node = buttom_node.get_child(0)
			self_init_pos = self.transform.origin
			center_init_size = center_node.get_min_aabb()
			top_init_pos = top_node.transform.origin
			buttom_init_pos = buttom_node.transform.origin
			return

		if(reposition):
			var y_change =  (center_node.get_min_aabb().y - center_init_size.y)  / 2.0
			var x_change =  (center_node.get_min_aabb().x - center_init_size.x)  / 2.0
			top_node.transform.origin.y = top_init_pos.y + y_change
			buttom_node.transform.origin.y = buttom_init_pos.y - y_change
			top_node.transform.origin.x = top_init_pos.x - x_change
			buttom_node.transform.origin.x = buttom_init_pos.x + x_change
			self.transform.origin.y = self_init_pos.y + y_change

func set_top(content):
	dialog_content["top"] = content
	if(top_text_reach_max_hide and top_text_max_char < content.length()):
		pass
	else:
		top_text_node.text = content

func set_center(content):
	dialog_content["center"] = content
	if(center_text_reach_max_hide and center_text_max_char < content.length()):
		buttom_node.show()
		center_text_node.text = dialog_content["center"].substr(0, center_text_max_char)
		dialog_content["center"] = dialog_content["center"].substr(center_text_max_char, -1)
		while(dialog_content["center"].length()> 0):
			await get_tree().create_timer(auto_scroll_duration).timeout
			if(dialog_content["center"].length()> center_text_max_char):
				center_text_node.text = dialog_content["center"].substr(0, center_text_max_char)
				dialog_content["center"] = dialog_content["center"].substr(center_text_max_char, -1)
			else:
				center_text_node.text = dialog_content["center"].substr(0, -1)
				dialog_content["center"] = ""
				buttom_node.hide()
	else:
		center_text_node.text = content
	
func set_buttom(content):
	buttom_text_node.text = content
	pass
