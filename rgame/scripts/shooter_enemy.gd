extends Node2D

var base_script = preload("res://scripts/enemy_base.gd").new()

var spear: PackedScene = preload("res://Assets/Skins/p_ike.tscn")

@export var min_time : float = 3.0
@export var max_time : float = 5.0


@export var max_health : int = base_script.max_health
var health : float = base_script.max_health;
var isAlive : bool = true

@export var speed : float = base_script.speed
@export var spd_mult : float = base_script.spd_mult

@export var min_dist : float = 120.0

@onready var _animation_player = $AnimationPlayer

@onready var shotClock = $ShootTimer

var player_node

func _ready():
	base_script.EnemyStartUp(get_parent().find_child("Player"), speed, spd_mult)
	# shotClock.wait_time = randf_range(min_time, max_time)
	shotClock.start(randf_range(min_time, max_time))
	
func _process(delta):
	var vel = Vector2.ZERO
	
	$Pike_Holder.global_rotation = base_script.GetPlayerAngle(position) + deg_to_rad(90)
	
	if (shotClock.time_left <= 3.0):
		$Pike_Holder.visible = true
	
	if (isAlive):
		# Shooting Code
		HandleShooting()
			
		#Animation and Movement Code
		var direction = sign(position.direction_to(base_script.GetPlayerPosition()).x)
		scale.x = direction
		
		vel = base_script.GeteEnemyVel(base_script.GetPlayerAngle(position), speed, delta)
		if (base_script.GetPlayerEnemyDist(position) > min_dist):
			shotClock.paused = true
			position += vel
			_animation_player.play("Move")
		else:
			shotClock.paused = false
			_animation_player.stop(true)
			
func HandleShooting():
	# print(shotClock.time_left)
	var angle = base_script.GetPlayerAngle(position)
	var pl_pos = base_script.GetPlayerPosition()
	
	if (shotClock.time_left <= 0.1):
		shotClock.stop()
		
		$Pike_Holder.visible = false
		
		var spee = spear.instantiate()
		get_tree().get_root().add_child(spee)
		spee.global_position = global_position
		
		var dir = (pl_pos - global_position).normalized()
		spee.global_rotation = angle
		spee.direction = dir
		# spike.Create(pl_pos, angle, position)
		# print("Not Throwing Away My Shot")
		
		shotClock.start(randf_range(min_time, max_time))
	
	# print(position)
		
		
		
	# screenSize = get_viewport_rect().size
	# hide()
	
# func start(pos):
# 	position = pos	
	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	

	pass # Replace with function body.
