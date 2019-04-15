extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (Texture) var texture

var meta_group

# Called when the node enters the scene tree for the first time.
func _ready():
	meta_group = get_tree().get_root().get_node("Root/MetaGroup")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()

func _draw():
	#
	for m in meta_group.get_children():
		var sz = Vector2(m.get_node("CollisionShape2D").shape.radius * 2, m.get_node("CollisionShape2D").shape.radius * 2)
		get_material().set_shader_param("modulate", m.modulate)
		draw_set_transform(m.position, 0, Vector2(1, 1))
		draw_texture_rect(texture, Rect2(-sz.x, -sz.y, sz.x*2, sz.y*2), false, modulate)
		