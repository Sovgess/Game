extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D 
@onready var player = $"../../Player/player"
const SPEED = 70
var direction = 1

func _process(delta: float) -> void:
	position.x += direction * SPEED * delta
	
func _on_timer_timeout() -> void:
	# Меняем направление патрулирования
	direction *= -1 
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h 

func _on_herodies_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.take_damage(50)
