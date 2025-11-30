extends Area2D

@export var speed : float = 4.0
@export var spd_mult : float = 10

var player_node

# @export var jumpHeight : float = 1

# var zPos : float = 0.0
# var zSpeed : float = 0.0

var screenSize

func _ready():
	speed *= spd_mult
	player_node = get_parent().find_child("Player")
	
func _process(delta):
	var vel = Vector2.ZERO
	
	if (player_node != null):
		var player_pos = player_node.position
		var diff = player_pos - position
		var angle = atan2(diff.y, diff.x)
		
		vel.x = cos(angle) * speed * delta
		vel.y = sin(angle) * speed * delta
		
	position += vel
	
	print(position)
		
		
		
	# screenSize = get_viewport_rect().size
	# hide()
	
# func start(pos):
# 	position = pos	
	
	
