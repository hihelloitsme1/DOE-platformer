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

func _physics_process(delta):
	if position.x < bounds.x or position.x > bounds.y:
		direction *= -1;
		timer.start()
		go = false;
		position.x = bounds.x if position.x < bounds.x else bounds.y;
	if (go):
		position.x += speed * direction * Engine.time_scale;
		if (animated_sprite_2d.animation != "hit"):
			animated_sprite_2d.play("run");
	else:
		if (animated_sprite_2d.animation != "hit"):
			animated_sprite_2d.play("idle");
	animated_sprite_2d.flip_h = direction > 0

func _on_timer_timeout():
	go = true;

func die():
	get_tree().reload_current_scene();


func _on_animated_sprite_2d_animation_finished():
	if (animated_sprite_2d.animation == "hit"):
		queue_free();


func _on_animated_sprite_2d_animation_changed():
	if (animated_sprite_2d):
		if (animated_sprite_2d.animation == "hit"):
			speed = 0;
