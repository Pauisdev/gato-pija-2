extends RayCast2D
signal collided
signal no_collision

func _physics_process(delta):
	if not is_colliding(): return emit_signal("no_collision")
	emit_signal("collided")
	print('collided', get_collider())
