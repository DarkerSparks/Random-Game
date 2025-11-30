extends Area2D

# NEEDS TO BE RELATIVE TO THE PLAYER

# func _ready():
# 	screenSize = get_viewport_rect().size
# 	speed *= spd_mult
	# hide()

@export var max_radius : float = 100	

@export var firing_rate : float = 1.0;
@export var num_of_bullets : int = 1;
@export var bullet_speed : float = 1.0

var mouse_pos

func start(pos):
	# speed *= spd_mult
	position = pos	
  	
#func _process(delta):	
		
func RotateWeapon():
	mouse_pos = get_local_mouse_position()
	rotation+= mouse_pos.angle() * 0.1
		
func IsMouseInside(pos):
	mouse_pos = get_global_mouse_position()
	var diff = mouse_pos - pos
	var distance = sqrt(diff.x*diff.x + diff.y*diff.y)
	
	# print(distance)
	
	return (distance <= max_radius)
	# radius = sqrt(pow((position.x-nodePos.x), 2) + pow((position.y-nodePos.y), 2))
	
