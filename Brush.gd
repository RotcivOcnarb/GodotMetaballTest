extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_vector = (get_global_mouse_position() - get_global_transform().get_origin()).normalized()
	rotation = atan2(mouse_vector.y, mouse_vector.x) + PI/2
	
	if get_parent().get_node("AnimatedSprite").flip_h:
		position = get_parent().get_node("BrushPosLeft").position
	else:
		position = get_parent().get_node("BrushPosRight").position
