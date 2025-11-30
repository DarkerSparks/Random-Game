extends Line2D

@export var length = 50
var point = Vector2()

func _process(delta):
	global_position = Vector2(0,65)
	global_rotation = 0
	global_scale.x = 1
	
	
	point = get_parent().global_position
	
	add_point(point)
	while get_point_count()>length:
			remove_point(0)

	
	
	# et_parent().find_child("Trail_Head").visible = (get_point_position(0) != get_parent().position)
