extends AnimatableBody2D

@onready var timer = $Timer
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var bounds: Vector2;
@export var speed: float = 1;
@export var pause_time: float = 1;
@export var start_direction: int = 1;
var direction: int;
var go: bool = true;

func _ready():
	direction = start_direction;
	timer.wait_time = pause_time;
	animated_sprite_2d.play("move");

func _physics_process(delta):
	if position.x < bounds.x or position.x > bounds.y:
		direction *= -1;
		timer.start()
		go = false;
		position.x = bounds.x if position.x < bounds.x else bounds.y;
		animated_sprite_2d.stop();
	if (go):
		position.x += speed * direction * Engine.time_scale;

func _on_timer_timeout():
	go = true;
	animated_sprite_2d.play("move");

func die():
	get_tree().reload_current_scene();
