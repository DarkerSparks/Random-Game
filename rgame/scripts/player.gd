extends Node2D

signal hit

@export var speed : float = 400.0
@export var spd_mult : float = 10

@export var max_cam_radius : float = 60

var mouse_pos

# var gun_pos
# var gun_rot
# @export var jumpHeight : float = 1

# var zPos : float = 0.0
# var zSpeed : float = 0.0
@onready var _animation_player = $AnimationPlayer
@onready var _camera = $Camera2D

func _ready():
	# screenSize = get_viewport_rect().size
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
	
	mouse_pos = get_global_mouse_position()
	
	Movement(delta)
	
	CameraMovement(delta)
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
		
	# var dot = position.dot(mouse_pos)
	var direction = mouse_pos.direction_to(position)
	# print(sign(direction))
	if vel.length() != 0:
		if (vel.x > 0):
			scale.x = 1
		elif (vel.x < 0):
			scale.x = -1
			
		_animation_player.play("Walk")
		# scale.x = sign(vel.x)
		# _animation_player.flip_h = (vel.x < 0)
	else:
		scale.x = -sign(direction.x)
		_animation_player.play("Idle")
		# $AnimatedSprite2D.flip_h = 
		
	position += vel * delta
	
func CameraMovement(delta):
	var diff = mouse_pos - position
	
	var math = sign(position.direction_to(mouse_pos).x)
	
	# print(position)
	
	 # print(position.dot(_camera.position))
	_camera.position = Vector2(diff.x * math, diff.y) * delta * max_cam_radius
	
	
	# if (diff.length() > min_cam_radius):
	
	# if (center.length() >= max_cam_radius):
	# 	print("FUCK FUCK FUCK FUCK FUCK")
	
	
	
	# print(_camera.position)
	# pass
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


func _on_body_entered(_body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)

	# Must be deferred as we can't change physics properties on a physics callback.
	# $CollisionShape2D.set_deferred("disabled", true)


func _on_area_2d_body_entered(body: Node2D) -> void:
	var body_shape_owner = body.shape_find_owner()
	print(body_shape_owner)
	pass # Replace with function body.
