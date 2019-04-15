extends KinematicBody2D

var left
var right

var side = 1

var velocity

export (float) var speed = 300

onready var meta = preload("res://Metaball_Template.tscn")

var animation
var shot_timer = 0

var colorTimer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2()
	animation = get_node("AnimatedSprite")

func spawn_paint():
	var m = meta.instance()
	m.position = get_node("Brush/Node2D").get_global_transform().get_origin()
			
	var vel = (get_node("Brush/Node2D").get_global_transform().get_origin() - get_node("Brush").get_global_transform().get_origin()).normalized()
	m.linear_velocity = vel * 300
	m.material = get_material().duplicate()
	m.modulate = Color.from_hsv(colorTimer - int(colorTimer), 1, 1, 1)
	m.linear_velocity = m.linear_velocity.rotated(rand_range(-0.1, 0.1))
	m.get_node("CollisionShape2D").set_shape(CircleShape2D.new())
	m.get_node("CollisionShape2D").shape.radius = rand_range(3,6)
			
	get_tree().get_root().get_node("Root/MetaGroup").add_child(m)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	colorTimer += delta
	
	if Input.is_action_pressed("shoot"):
		if shot_timer <= 0:
			shot_timer = 0
			#spawn_paint()
		
	shot_timer -= delta
	
	if Input.is_action_just_pressed("left"):
		left = true
		side = -1
	elif Input.is_action_just_pressed("right"):
		right = true
		side = 1
		
	if Input.is_action_just_released("left"):
		left = false
	elif Input.is_action_just_released("right"):
		right = false
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = -200
		
	if not is_on_floor():
		velocity += Physics2DServer.area_get_param(
    	get_world_2d().get_space(),
    	Physics2DServer.AREA_PARAM_GRAVITY_VECTOR) * ((5 if Input.is_action_pressed("jump") else 10) + (10 if velocity.y > 0 else 0))
	
	animation.flip_h = side == -1
	
	if not is_on_floor():
		animation.animation = "Jump"
	elif abs(velocity.x) > 10:
		animation.animation = "Run"
	else:
		animation.animation = "Idle" 
	
	if left:
		velocity.x += (-speed - velocity.x)/5
	elif right:
		velocity.x += (speed - velocity.x)/5
	else:
		velocity.x += (0 - velocity.x)/5
	
func _physics_process(delta):
	move_and_slide(velocity, Vector2(0, -1))
