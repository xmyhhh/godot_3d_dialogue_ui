shader_type spatial;
render_mode unshaded, diffuse_toon, ambient_light_disabled, skip_vertex_transform;
uniform vec2 size = vec2(256.0, 256.0);
uniform vec3 origin_offset = vec3(0.0);
uniform vec4 color_d  : source_color = vec4(1.0);


vec4 draw_rounded_rectangle(vec4 in_color, vec2 in_pos, vec4 draw_color, vec2 pos, float width, float height, float r){
	vec4 out_color = in_color;
	vec2 in_pos_to_center = in_pos - pos;
	
//	if( 2. * r > width || 2. * r > height)
//		return out_color;

	if( abs(in_pos_to_center.x) > width / 2.0 || abs(in_pos_to_center.y) > height/2.0)
		return out_color;

	if(abs(in_pos_to_center.y) < (height / 2. - r)  || abs(in_pos_to_center.x) < (width / 2. - r))
		out_color = draw_color;
	
	if(length(abs(in_pos_to_center) - vec2(width/2.0 - r, height/2.0 - r)) < r)
		out_color = draw_color;
	
	
	
	out_color.a =  pow(cos(max(32. -  (height / 2. ) + abs(in_pos_to_center.y), 0.0)), 1.0);
		
	return out_color;
}

void vertex(){
	mat4 INV_CAMERA_MATRIX = INV_VIEW_MATRIX;
	mat4 CAMERA_MATRIX = VIEW_MATRIX;
	mat4 WORLD_MATRIX = MODEL_MATRIX;

	mat4 modelView = CAMERA_MATRIX * WORLD_MATRIX;
	// First colunm.
	modelView[0][0] = 1.0; 
	modelView[0][1] = 0.0; 
	modelView[0][2] = 0.0; 

	// Second colunm.
	modelView[1][0] = 0.0; 
	modelView[1][1] = 1.0; 
	modelView[1][2] = 0.0; 

	// Thrid colunm.
	modelView[2][0] = 0.0; 
	modelView[2][1] = 0.0; 
	modelView[2][2] = 1.0; 
	
    VERTEX =  (modelView * vec4(VERTEX, 1.0)).xyz ;
	
	vec4 offset_dir = VIEW_MATRIX  * MODEL_MATRIX * vec4(origin_offset, 1.0) - VIEW_MATRIX  * MODEL_MATRIX * vec4(0.,0.,0., 1.0);
	float offset_dir_z_dis = dot(vec3(0, 0, -1), offset_dir.xyz);
	VERTEX = VERTEX - offset_dir.xyz + vec3(origin_offset.x, origin_offset.y, 0.);
}


void fragment() {
	// Place fragment code here.
	vec2 uv_center = (UV - vec2(0.5, 0.5));
	vec2 pixel_pos = uv_center * size;
	pixel_pos.y = -pixel_pos.y;
	vec4 color = vec4(0.);
	
	vec2 triangle_size =  vec2(12.0, 14.0) ;
	
	vec2 rounded_rectangle_pos = vec2(0., 6.);
	vec2 rounded_rectangle_size = size;
	rounded_rectangle_size.y = rounded_rectangle_size.y - triangle_size.y - rounded_rectangle_pos.y;
	
	vec4 rounded_rectangle_color = color_d;
	float rounded_rectangle_r = 32.0;
	
	vec2 triangle_pos = rounded_rectangle_pos - vec2(0.0, rounded_rectangle_size.y / 2.) ;
	vec4 triangle_color = color_d;

	color = draw_rounded_rectangle(color, pixel_pos, rounded_rectangle_color,rounded_rectangle_pos, rounded_rectangle_size.x, rounded_rectangle_size.y, rounded_rectangle_r);

	ALBEDO = color.rgb * 0.2;

	ALPHA = color.a ;

}

