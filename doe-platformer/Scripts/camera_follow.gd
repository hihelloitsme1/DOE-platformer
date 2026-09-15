extends Camera2D

@onready var player = $"../Player"
@export var bounds: Vector2

func _process(delta):
	position.x = player.position.x if player.position.x > bounds.x else bounds.x;
	position.y = player.position.y if player.position.y < bounds.y else bounds.y;
