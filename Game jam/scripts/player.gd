extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 130
const JUMP_VELOCITY = -300.0

var knockback_timer: float = 0.0
var knockback: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta


	# MOVIMENTO SEMPRE ATIVO
	var direction := Input.get_axis("mover_dir", "mover_esq")

	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	# KNOCKBACK ADICIONA AO MOVIMENTO
	if knockback_timer > 0.0:
		velocity += knockback
		knockback_timer -= delta
		
		if knockback_timer <= 0.0:
			knockback = Vector2.ZERO


	# PULO
	if Input.is_action_just_pressed("pulo") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# ANIMAÇÃO
	if is_on_floor():
		if velocity.x == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		if velocity.y < 0:
			animated_sprite_2d.play("jump")
		else:
			animated_sprite_2d.play("fall")


	move_and_slide()


func apply_knockback(direction: Vector2, force: float, duration: float) -> void:
	# sempre vai para longe do slime
	knockback = direction.normalized() * force
	knockback_timer = duration
