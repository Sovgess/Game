extends Node2D
@onready var anim = $AnimatedSprite2D




	


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.spring()
		anim.play("bounce")


func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "bounce":
		anim.play("idle")
