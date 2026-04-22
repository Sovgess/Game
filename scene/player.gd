extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -350.0

@onready var anim = $AnimatedSprite2D
@onready var hp = $"../../CanvasLayer/HP"

var health = 100
var gold = 0
var is_dead = false

func spring():
	velocity.y = -700

func _ready():
	hp.max_value = 100
	hp.value = health
	hp.visible = true

func respawn():
	self.global_position = Vector2(100, 450)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "TileMapSpikes":
			take_damage(100)
	
	if is_dead:
		move_and_slide()
		return
	

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if not is_on_floor():
		if velocity.y < 0:
			anim.play("jump")
		else:
			anim.play("fall")
	else: 
		if direction:
			anim.play("run")
		else:
			anim.play("idle")
	
	
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false

	move_and_slide()

func take_damage(damage):
	if is_dead:
		return
	health -= damage
	hp.value = health
	$AnimationPlayer.play("take_hit")
	if health <= 0:
		is_dead = true
		anim.play("die")
		velocity.x = 0
		await anim.animation_finished
		Global.last_level_path = get_tree().current_scene.scene_file_path
		get_tree().change_scene_to_file("res://scene/deadmenu.tscn")
	

	
	
	
	
	



	
	
	
	
