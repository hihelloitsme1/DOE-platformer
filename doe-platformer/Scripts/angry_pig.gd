extends AnimatableBody2D

@onready var timer = $Timer
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var bounds: Vector2;
@export var speed: float = 1;
@export var pause_time: float = 1;
@export var start_direction: int = 1;
@export var bounce_height: float = -200
var direction: int;
var go: bool = true;
var hit: bool = false;

func _ready():
	direction = start_direction;
	timer.wait_time = pause_time;
	hit = false;

func _physics_process(delta):
	print(animated_sprite_2d.animation)
	if position.x < bounds.x or position.x > bounds.y:
		direction *= -1;
		timer.start()
		go = false;
		position.x = bounds.x if position.x < bounds.x else bounds.y;
	if (go || hit):
		if (animated_sprite_2d.animation != "hit_1" && animated_sprite_2d.animation != "hit_2"):
			if !hit:
				animated_sprite_2d.play("walk");
				position.x += speed * direction * Engine.time_scale;
			else:
				animated_sprite_2d.play("run")
				position.x += speed * direction * 1.5 * Engine.time_scale;
	else:
		if (animated_sprite_2d.animation != "hit_1" && animated_sprite_2d.animation != "hit_2"):
			animated_sprite_2d.play("idle");
	animated_sprite_2d.flip_h = direction > 0

func _on_timer_timeout():
	go = true;

func die():
	get_tree().reload_current_scene();


func _on_animated_sprite_2d_animation_finished():
	if (animated_sprite_2d.animation == "hit_1"):
		hit = true;
		animated_sprite_2d.play("run")
	elif (animated_sprite_2d.animation == "hit_2"):
		queue_free();

func _on_hitbox_body_entered(body):
	if !hit:
		animated_sprite_2d.play("hit_1");
	else:
		animated_sprite_2d.play("hit_2");
	body.velocity.y = bounce_height;
