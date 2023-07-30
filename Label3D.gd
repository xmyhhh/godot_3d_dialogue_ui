
extends Label3D
 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(self.get_aabb().size)
	var childnode = get_children()[0]
	childnode.scale.x = self.get_aabb().size.x /5.12  + 0.3
	childnode.scale.y = self.get_aabb().size.y /2.56 + 0.2
	var mat = childnode.material_override
	mat.set_shader_parameter("size", Vector2(childnode.scale.x * 100, childnode.scale.y * 100))

