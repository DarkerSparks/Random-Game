extends Area2D

@export var speed : float = 400.0
@export var spd_mult : float = 10

var mouse_pos

# var gun_pos
# var gun_rot
# @export var jumpHeight : float = 1

# var zPos : float = 0.0
# var zSpeed : float = 0.0

var screenSize

func _ready():
	screenSize = get_viewport_rect().size
	speed *= spd_mult
	
	# gun_pos = get_node("Weapon_Object").Position
	# gun_rot = get_node("Weapon_Object").Rotation
	# hide()
	
func start(pos):
	# speed *= spd_mult
	position = pos	

func _process(delta):
	# gun_pos = get_node("Weapon_Object").Position
	# n_rot = get_node("Weapon_Object").Rotation
	
	# mouse_pos = get_local_mouse_position()
	# gun_rot += mouse_pos.angle() * 0.1
	
	Movement(delta)
	# Jump(delta)
	
	# print(zPos);
	
func Movement(delta):
	var vel = Vector2.ZERO
	
	if (abs(HoriInputs()) > 0 and abs(VertInputs()) > 0):
		vel.x += HoriInputs() * (speed) * delta / sqrt(2);
		vel.y += VertInputs() * (speed) * delta / sqrt(2);	
	else:
		vel.x += HoriInputs() * (speed) * delta;
		vel.y += VertInputs() * (speed) * delta;
		# $AnimatedSprite2D.flip_h = 
		
	position += vel * delta
	# position = position.clamp(Vector2.ZERO, screenSize)
	
# func Jump(delta):
# 	if (Input.is_action_just_pressed("jump")):
# 		zPos += 16;
	
func HoriInputs():
	if Input.is_action_pressed("move_left"):
		return -1
	if Input.is_action_pressed("move_right"):
		return 1
		
	return 0;
	
func VertInputs():
	if Input.is_action_pressed("move_down"):
		return 1
	if Input.is_action_pressed("move_up"):
		return -1
		
	return 0;
	# show()
	# pass # Replace with function body.
