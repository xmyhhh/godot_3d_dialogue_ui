@tool
extends Node3D


@export var top:Node
@export var center:Node 
@export var buttom:Node 

var center_init_size
var top_init_pos
var buttom_init_pos

func _ready():
	if(top && center && buttom):
		center_init_size = center.get_aabb().size
		top_init_pos = top.transform.origin
		buttom_init_pos = buttom.transform.origin
	
func _process(delta):
	return
	if(top && center && buttom):
		top.transform.y = top_init_pos.y + center.get_aabb().size.y - center_init_size.y
		buttom.transform.y = buttom_init_pos.y + center.get_aabb().size.y - center_init_size.y
	pass
