extends TileMap

func is_touching_player():
	#for i in get_slide_count():
	#	if get_slide_collision(i).collider.is_in_group("danger"): return true
	#return false
	pass

func _process(delta):
	if is_touching_player():
		position.x += 1 * delta
	

