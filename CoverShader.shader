shader_type canvas_item;
render_mode blend_disabled;

void fragment(){
	vec4 c = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0);
	COLOR = vec4(1.0 - c.rgb, 1.0);
}