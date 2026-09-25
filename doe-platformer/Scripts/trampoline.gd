extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var bounce_height: float = -400

func _on_body_entered(body):
	if body.name == "Player":
		body.velocity.y = bounce_height;
		animated_sprite_2d.play("bounce");
