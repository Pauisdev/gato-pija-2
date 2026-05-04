extends Camera2D
const HORIZONTAL_MOVEMENT = 640
const VERTICAL_MOVEMENT = 361
export var movement_speed = 0.35

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func move_left():
	create_tween().tween_property(self, "position", Vector2(position.x - HORIZONTAL_MOVEMENT, position.y), movement_speed)
	
func move_right():
	create_tween().tween_property(self, "position", Vector2(position.x + HORIZONTAL_MOVEMENT, position.y), movement_speed)
	
func move_up():
	create_tween().tween_property(self, "position", Vector2(position.x, position.y - VERTICAL_MOVEMENT), movement_speed)
	
func move_down():
	create_tween().tween_property(self, "position", Vector2(position.x, position.y + VERTICAL_MOVEMENT), movement_speed)
	
func is_inside_vertical_bounds(node: Node):
	return position.y - VERTICAL_MOVEMENT / 2 < node.position.y and node.position.y < position.y + VERTICAL_MOVEMENT / 2

func is_inside_horizontal_bounds(node: Node):
	return position.x - HORIZONTAL_MOVEMENT / 2 < node.position.x and node.position.x < position.x + HORIZONTAL_MOVEMENT / 2
