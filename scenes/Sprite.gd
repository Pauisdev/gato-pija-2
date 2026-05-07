extends Polygon2D
export var size = 24
export var shard_count = 2
var shard_velocity_map = {}

func _ready():
	randomize()

func explode():
	var points = polygon
	for i in range(shard_count):
		points.append(Vector2(randi() % size, randi() % size))
	
	var delaunay_points = Geometry.triangulate_delaunay_2d(points)
	
	if not delaunay_points:
		print('Unable to calculate delaunay points. Failed to explode character')
		return
	
	for index in len(delaunay_points) / 3:
		var shard_pool = PoolVector2Array()	
		var center = Vector2.ZERO
		
		for n in range(3):
			var current = points[delaunay_points[index * 3 + n]]
			shard_pool.append(current)
			center += current
		
		center = center / 3
		var shard = Polygon2D.new()
		shard.polygon = shard_pool
		shard.texture = texture
		shard.offset = offset
		shard.texture_offset = -offset
		shard_velocity_map[shard] = Vector2(size, size) - center
		get_parent().add_child(shard)
		
	color.a = 0
	
func _process(delta):
	for child in shard_velocity_map.keys():
		$"../CollisionShape2D".set_deferred("disabled", true)
		get_parent().position.x += 12 * delta
		child.position -= shard_velocity_map[child] * delta * 10
		child.rotation -= shard_velocity_map[child].x * delta * 0.1
