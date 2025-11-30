extends Area2D

var base_script = preload("res://scripts/enemy_base.gd").new()

@export var max_health : int = base_script.max_health
var health : float = base_script.max_health;

@export var speed : float = base_script.speed
@export var spd_mult : float = base_script.spd_mult

# var player_node

func _ready():
	# player_node = get_parent().find_child("Player")
	base_script.EnemyStartUp(get_parent().find_child("Player"), speed, spd_mult)
	
func _process(delta):
	var vel = Vector2.ZERO
	vel = base_script.GeteEnemyVel(base_script.GetPlayerAngle(position), speed, delta)
	position += vel
		
		
		
	# screenSize = get_viewport_rect().size
	# hide()
	
# func start(pos):
# 	position = pos	
	
	
