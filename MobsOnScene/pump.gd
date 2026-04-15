extends CharacterBody2D
@onready var player = $"../../Player/player"
@onready var anim = $AnimationPlayer

var speed = 100
var chase = false
var direction

enum {
	IDLE,
	ATTACK,
	CHASE,
}
var state: int = 0: # Когда будет любое значение кроме нуля воспроизведется то что ниже
	set(value):
		state = value
		match state:
			IDLE:
				idle_state()
			ATTACK:
				attack_state()


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if state == ATTACK:
		move_and_slide()
		return
	if state == CHASE:
		chase_state()
	move_and_slide()


func _on_attackrange_body_entered(body: Node2D) -> void:
	if body.name == "player":
		state = ATTACK
func _on_detector_body_entered(body: Node2D) -> void:
	if body.name == "player":
		state = CHASE
func _on_detector_body_exited(body: Node2D) -> void:
	if body.name == "player":
		state = IDLE

		
		
func chase_state():
	direction = sign(player.global_position - global_position)
	velocity.x = direction.x * speed
	anim.play('run')
	if direction.x < 0:
		$attack_direction.scale.x = -1
		$AnimatedSprite2D.flip_h = true
	else:
		$attack_direction.scale.x = 1
		$AnimatedSprite2D.flip_h = false
func idle_state():
	velocity.x = 0
	anim.play("idle")
func attack_state():
	anim.play("attack")
	player.take_damage(20)
	await anim.animation_finished
	$attack_direction/attackrange/CollisionShape2D.disabled = true
	$attack_direction/attackrange/CollisionShape2D.disabled = false
	state = CHASE
