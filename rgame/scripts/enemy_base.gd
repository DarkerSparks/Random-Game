extends Object

@export var max_health : int = 5
var health : float = max_health;

@export var speed : float = 4.0
@export var spd_mult : float = 10

var isAlive : bool = true
var enemy_type : int;

var player_node

var screenSize
	
func EnemyStartUp(init_player_node, _enemy_speed, enemy_spd_mult):
	_enemy_speed *= enemy_spd_mult
	player_node = init_player_node
	# player_node = get_parent().find_child("Player")
	
func GeteEnemyVel(pl_angle, enemy_speed, delta):
	var vel = Vector2.ZERO
	if (player_node != null):
		vel.x = cos(pl_angle) * enemy_speed * delta
		vel.y = sin(pl_angle) * enemy_speed * delta
	
	return vel
	# position += vel
	
func GetPlayerPosition():
	return player_node.global_position

func GetPlayerAngle(enemy_position):
	if (player_node != null):
		var player_pos = player_node.position
		var diff = player_pos - enemy_position
		
		return atan2(diff.y, diff.x)
		
	return 0.0
		
func GetPlayerEnemyDiff(enemy_position):
	if (player_node != null):
		var player_pos = player_node.position
		return player_pos - enemy_position
		
	return enemy_position
	
func GetPlayerEnemyDist(enemy_position):
	return GetPlayerEnemyDiff(enemy_position).length()
		
	# screenSize = get_viewport_rect().size
	# hide()
	
# func start(pos):
# 	position = pos	
	
	
