extends StaticBody2D

@onready var timer = $Timer

var shake: bool = false;
var shake_strength = 1;
var start_pos;

func _ready():
	start_pos = position

func _process(delta):
	if shake:
		position = start_pos + Vector2(randf_range(-shake_strength, shake_strength), randf_range(-shake_strength, shake_strength));
	else:
		position = start_pos;

func _on_hitbox_body_entered(body):
	if body.name == "Player" && !shake:
		shake = true;
		timer.start();

func _on_timer_timeout():
	queue_free();
