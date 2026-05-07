extends CPUParticles2D
onready var player = $"../../Player"
onready var original_color = color

func _process(delta):
	var distance = global_position.distance_to(player.global_position)
	var transparency = range_lerp(distance, 0, 70, 1, 0.4)
	if transparency < 0.4: transparency = 0.4
	var original_color_with_transparency = Color(original_color, transparency)
	var light = range_lerp(distance, 0, 70, 0.7, 0.4)
	if light < 0.4: light = 0.4
	color = original_color_with_transparency.lightened(light)
