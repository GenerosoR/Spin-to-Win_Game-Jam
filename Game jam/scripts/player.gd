extends CharacterBody2D
class_name Player

@onready var sfx_jump: AudioStreamPlayer2D = $sfx_jump
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100
const JUMP_VELOCITY = -400.0

var gravity_force = 900.0

var knockback_timer: float = 0.0
var knockback: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:

	# =========================
	# ROTAÇÃO
	# =========================
	var rotation_speed = 2.5

	if Input.is_action_pressed("girar_tras"):
		rotation -= rotation_speed * delta

	if Input.is_action_pressed("girar_frente"):
		rotation += rotation_speed * delta


	# =========================
	# DIREÇÕES BASEADAS NA ROTAÇÃO
	# =========================
	up_direction = Vector2.UP.rotated(rotation)
	var down_direction = -up_direction
	var right_dir = Vector2.RIGHT.rotated(rotation)


	# =========================
	# GRAVIDADE RADIAL
	# =========================
	velocity += down_direction * gravity_force * delta


	# =========================
	# INPUT
	# =========================
	var input_dir := Input.get_axis("mover_dir", "mover_esq")


	# =========================
	# MOVIMENTO FIXO (SEM ACELERAÇÃO / SEM SLIDE)
	# =========================
	var ground_velocity = velocity.project(right_dir)

	if is_on_floor():
		# velocidade travada no chão
		ground_velocity = right_dir * input_dir * SPEED
	else:
		# controle leve no ar
		ground_velocity = ground_velocity.move_toward(
			right_dir * input_dir * SPEED,
			300 * delta
		)

	# flip do sprite
	if input_dir > 0:
		animated_sprite_2d.flip_h = false
	elif input_dir < 0:
		animated_sprite_2d.flip_h = true


	# =========================
	# RECOMBINA VELOCIDADE
	# =========================
	velocity = velocity.project(down_direction) + ground_velocity


	# =========================
	# PULO
	# =========================
	if Input.is_action_just_pressed("pulo") and is_on_floor():
		velocity = up_direction * abs(JUMP_VELOCITY)
		sfx_jump.play()


	# =========================
	# ANIMAÇÃO
	# =========================
	if is_on_floor():
		print(velocity.length())
		if abs(velocity.length()) < 50:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		if velocity.dot(up_direction) < 0:
			animated_sprite_2d.play("fall")
		else:
			animated_sprite_2d.play("jump")


	move_and_slide()
