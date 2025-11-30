extends Node2D

# NEEDS TO BE RELATIVE TO THE PLAYER

# func _ready():
# 	screenSize = get_viewport_rect().size
# 	speed *= spd_mult
	# hide()
	
var spear: PackedScene = preload("res://bullet.tscn")

@export var max_radius : float = 50

@export var firing_rate : float = 1.0;
@export var num_of_bullets : int = 1;
@export var bullet_speed : float = 1.0

@export var offset : Vector2 = Vector2(1, 1)

@onready var shotClock = $ShootTimer

var mouse_pos
  	
#func _process(delta):	

func _process(delta: float) -> void:
	RotateWeapon()
	MoveWeapon()
	ShootBullet()
	pass
		
func RotateWeapon():
	mouse_pos = get_local_mouse_position()
	rotation+= mouse_pos.angle() * 0.1
	
func MoveWeapon():
	mouse_pos = get_global_mouse_position()
	var diff = mouse_pos - get_parent().global_position
	var angle = atan2(diff.y, diff.x)
	
	# mouse_pos = get_global_mouse_position()
	if (diff.length() > max_radius):
		global_position = (get_parent().global_position + offset) + (Vector2(cos(angle), sin(angle)) * max_radius)
	else:
		global_position = mouse_pos
		
		
func ShootBullet():
	mouse_pos = get_global_mouse_position()
	var diff = mouse_pos - get_parent().global_position
	var angle = atan2(diff.y, diff.x)
	
	if (shotClock.time_left <= 0.1 and Input.is_action_just_pressed("jump")):
		shotClock.stop()
		
		var spee = spear.instantiate()
		get_tree().get_root().add_child(spee)
		spee.global_position = global_position
		
		var dir = diff.normalized()
		spee.global_rotation = angle
		spee.direction = dir
		
		shotClock.start(firing_rate)
		
		pass
	# radius = sqrt(pow((position.x-nodePos.x), 2) + pow((position.y-nodePos.y), 2))
	
