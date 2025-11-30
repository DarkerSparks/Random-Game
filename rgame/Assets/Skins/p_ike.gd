extends Node2D
	
@export var speed : float = 300 #put your rocket speed
var direction : Vector2 = Vector2.LEFT # default direction

func _process(delta):
	var angle = global_rotation
	# translate(Vector2(cos(angle), sin(angle)) * speed * delta)
	translate(direction*speed*delta)

func _on_VisibleOnScreenNotifier2D_screen_exited():
	queue_free()
	
	
