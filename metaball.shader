shader_type canvas_item;
render_mode blend_mix;
uniform vec4 modulate;

void fragment(){
	float d = min(length(UV - vec2(0.5, 0.5)) * 2.0, 1.0);
	COLOR = vec4(modulate.rgb, 1.0 - d);
	//COLOR = texture(TEXTURE,  UV);
}