shader_type spatial;
render_mode unshaded, diffuse_toon, ambient_light_disabled, skip_vertex_transform;
uniform vec2 size = vec2(256.0, 256.0);
uniform vec3 origin_offset = vec3(0.0);



vec4 draw_rounded_rectangle(vec4 in_color,vec2 in_pos, vec4 draw_color, vec2 pos, float width, float height, float r){
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

	return out_color;
}



void fragment() {
	// Place fragment code here.
	vec2 uv_center = (UV - vec2(0.5, 0.5));
	vec2 pixel_pos = uv_center * size;
	pixel_pos.y = -pixel_pos.y;
	vec4 color = vec4(0.);
	
	vec2 triangle_size =  vec2(12.0, 14.0) ;
	
	vec2 rounded_rectangle_pos = vec2(0., 8.);
	vec2 rounded_rectangle_size = size;
	rounded_rectangle_size.y = rounded_rectangle_size.y - triangle_size.y - rounded_rectangle_pos.y;
	
	vec4 rounded_rectangle_color = vec4(1.);
	float rounded_rectangle_r = 32.0;

	color = draw_rounded_rectangle(color, pixel_pos, rounded_rectangle_color,rounded_rectangle_pos, rounded_rectangle_size.x, rounded_rectangle_size.y, rounded_rectangle_r);

	ALBEDO = color.rgb;
	ALBEDO = vec3(0.0);
	ALPHA = color.a;
	ALPHA = color.a + 1.;
}

