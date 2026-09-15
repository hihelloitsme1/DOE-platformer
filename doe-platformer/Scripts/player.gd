extends CharacterBody2D

@export var animated_sprite_2d: AnimatedSprite2D
#
const SPEED = 150.0
const JUMP_VELOCITY = -300.0

func _ready():
	animated_sprite_2d.play("idle")

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
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
