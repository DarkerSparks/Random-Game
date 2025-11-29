extends Area2D

@export var speed : float = 400.0
@export var spd_mult : float = 10

# @export var jumpHeight : float = 1

# var zPos : float = 0.0
# var zSpeed : float = 0.0

var screenSize

func _ready():
	screenSize = get_viewport_rect().size
	# hide()
	
func start(pos):
	position = pos	

func _process(delta):
	Movement(delta)
	Jump(delta)
	
	# print(zPos);
	
func Movement(delta):
	var vel = Vector2.ZERO
	
	if (abs(HoriInputs()) > 0 and abs(VertInputs()) > 0):
		vel.x += HoriInputs() * (speed * spd_mult) * delta / sqrt(2);
		vel.y += VertInputs() * (speed * spd_mult) * delta / sqrt(2);	
	else:
		vel.x += HoriInputs() * (speed * spd_mult) * delta;
		vel.y += VertInputs() * (speed * spd_mult) * delta;
		# $AnimatedSprite2D.flip_h = 
		
	position += vel * delta
	position = position.clamp(Vector2.ZERO, screenSize)
	
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
