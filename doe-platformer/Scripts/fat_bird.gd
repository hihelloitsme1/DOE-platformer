extends Area2D

@onready var timer = $Timer
@onready var animated_sprite_2d = $AnimatedSprite2D

var acceleration: float = 10
var jumped: bool = false
var speed: float = 0
var timed: bool = false
var distance: float = 10;

func _process(delta):
	var player_position = get_tree().current_scene.get_node("Player").position
	if (player_position.y > position.y && abs(player_position.x - position.x) < distance && not jumped):
		jumped = true
		animated_sprite_2d.play("idle")
		timer.start()
	if (jumped):
		speed += acceleration
		position.y += speed * delta

func die():
	get_tree().reload_current_scene();

func _on_animated_sprite_2d_animation_finished():
	if (animated_sprite_2d.animation == "hit"):
		queue_free();


func _on_timer_timeout():
	timed = true


func _on_body_entered(body):
	if body && timed:
		if body is TileMapLayer:
			speed = 0;
			jumped = false;
			animated_sprite_2d.stop()
