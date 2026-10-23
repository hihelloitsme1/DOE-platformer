extends AnimatableBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

@export var bounds: Vector2;
@export var speed: float = 1;
@export var start_direction: int = -1;
var direction: int;

func _ready():
	direction = start_direction;

func _physics_process(delta):
	if (animated_sprite_2d.animation != "hit"):
		animated_sprite_2d.play("idle");
		position.x += speed * direction * Engine.time_scale;
	if position.x < bounds.x or position.x > bounds.y:
		position.x = bounds.x if position.x < bounds.x else bounds.y;
		direction *= -1;
		animated_sprite_2d.flip_h = direction > 0

func die():
	get_tree().reload_current_scene();


func _on_animated_sprite_2d_animation_finished():
	if (animated_sprite_2d.animation == "hit"):
		queue_free();


func _on_animated_sprite_2d_animation_changed():
	if (animated_sprite_2d):
		if (animated_sprite_2d.animation == "hit"):
			speed = 0;
