shader_type spatial;
render_mode unshaded, diffuse_toon, ambient_light_disabled;
uniform bool flip = true;
void fragment() {
	vec4 color = vec4(0.);
	color.rgb = ALBEDO;
	ALBEDO = vec3(1.0);
	if(flip)
		ALPHA = 1.0 - UV.y;
	else
		ALPHA = UV.y;
}
