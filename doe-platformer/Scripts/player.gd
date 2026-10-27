extends CharacterBody2D

@export var animated_sprite_2d: AnimatedSprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
const COYOTE_TIME = 0.1

var dead;
var time_since_floor: float

var spawn;

func _ready():
	dead = false;
	animated_sprite_2d.play("idle")
	Engine.time_scale = 1;

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if dead: return;
	
	if is_on_floor():
		time_since_floor = 0;
	else:
		time_since_floor += delta;
	
	if Input.is_action_just_pressed("jump") and time_since_floor <= COYOTE_TIME:
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction:
		animated_sprite_2d.flip_h = direction < 0
	
	if is_on_floor():
		if direction:
			animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("idle")
	else:
		if velocity.y < 100:
			animated_sprite_2d.play("jump")
		else:
			animated_sprite_2d.play("fall")
	move_and_slide()

func die():
	dead = true;
	animated_sprite_2d.play("hit");
	Engine.time_scale = 0.5;

func _on_animated_sprite_2d_animation_looped():
	if (animated_sprite_2d.animation == "hit"):
		get_tree().reload_current_scene();
