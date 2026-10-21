extends Area2D

@export var level_path: String
@onready var animated_sprite_2d = $AnimatedSprite2D

func _on_body_entered(body):
	if body.name == "Player":
		animated_sprite_2d.play("flag_out");

func _on_animated_sprite_2d_animation_finished():
	if animated_sprite_2d.animation == "flag_out":
		get_tree().change_scene_to_file(level_path)
