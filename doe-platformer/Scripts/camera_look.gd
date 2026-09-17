extends Camera2D

var speed = 10.0;
var look_offset = 50;

var target_offset: Vector2;

func _process(delta):
	if Input.is_action_pressed("look_down"):
		target_offset = Vector2(0, look_offset)
	else:
		target_offset = Vector2(0, 0)
		
	offset = offset.lerp(target_offset, speed * delta)
