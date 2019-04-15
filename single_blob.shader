shader_type canvas_item;
render_mode blend_add;
uniform vec4 color : hint_color;

void fragment(){
	vec4 c = texture(TEXTURE, UV);
	COLOR = vec4(color.rgb, c.a);
}