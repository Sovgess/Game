extends StaticBody2D

var time = 1
var broken = false

func _ready():
	set_process(false)

func _process(delta):
	time += 1.7
	$Crashingplatform.position += Vector2(0, sin(time) * 2)


func _on_area_2d_body_entered(body):
	if body.name == "player" and broken == false:
		set_process(true)
		$TimerBreak.start(0.7)

func _on_timer_break_timeout() -> void:
	broken = true
	set_process(false)

	$GPUParticles2D.emitting = true
	$CollisionShape2D.disabled = true
	$Crashingplatform.visible = false
	$Area2D.monitoring = false

	$TimerRespawn.start(4.0)


func _on_timer_respawn_timeout() -> void:
	broken = false

	$GPUParticles2D.emitting = false
	$CollisionShape2D.disabled = false
	$Crashingplatform.visible = true
	$Area2D.monitoring = true
