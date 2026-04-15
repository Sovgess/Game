extends StaticBody2D

# Тайл
var time = 1

func _ready() -> void:
	set_process(false)

func _process(delta: float) -> void:
	time += 1.7
	$Crashingtile.position += Vector2(0, sin(time) * 2)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		set_process(true)
		$Timer.start(0.7)
		

func _on_timer_timeout() -> void:
	if is_processing():
		set_process(false)
		$GPUParticles2D.emitting = true
		$Area2D.queue_free()
		$CollisionShape2D.queue_free()
		$Crashingtile.queue_free()
		$Timer.start(1.2)
	else:
		queue_free()
