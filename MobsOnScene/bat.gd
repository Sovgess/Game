extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D 
const SPEED = 70
var direction = -1

func _process(delta: float) -> void: # Метод вызывается каждый кадр
	position.x += direction * SPEED * delta # Двигаем врага по оси X

func _on_timer_timeout() -> void:
	# Меняем направление движения каждые N секунд
	direction *= -1 
	# Разворачиваем спрайт по направлению движения
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h 

func _on_herodies_body_entered(body: Node2D) -> void:
	if body.name == "player":
		# Вызываем функцию из скрипта игрока
		body.take_damage(50)
