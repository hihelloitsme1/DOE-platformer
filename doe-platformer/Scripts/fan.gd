extends Area2D

var player;
var strength: float = 150;

func _physics_process(delta):
	if player:
		player.velocity.y = -strength

func _on_body_entered(body):
	if body.name == "Player":
		player = body;
func _on_body_exited(body):
	if body.name == "Player":
		player = null;
