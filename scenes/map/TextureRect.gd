extends TextureRect
var offset = 0

func _process(delta):
	offset -=  delta / 20;
	material.set_shader_param("offset", offset);
