extends Viewport

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	world_2d = get_tree().get_root().get_viewport().world_2d
	world = get_tree().get_root().get_viewport().world

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	
