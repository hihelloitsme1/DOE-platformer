extends Area2D

var bounce_height: float = -200
@onready var animated_sprite_2d = $"../AnimatedSprite2D"

func _on_body_entered(body):
	if body.name == "Player":
		body.velocity.y = bounce_height;
		animated_sprite_2d.play("hit");
