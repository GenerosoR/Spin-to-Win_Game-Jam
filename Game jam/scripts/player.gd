extends CharacterBody2D


const SPEED = 130
const JUMP_VELOCITY = -300.0
const jump_pad_height: float = -500.0
const MOEDA = 1
var valor_moeda = 1

func _physics_process(delta: float) -> void:
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()

	
	const MOEDA: float = 1
	var valor_moeda: float = 1
	
func _process(delta: float):
	if Input.is_action_just_pressed("crescer"):
		valor_moeda += MOEDA/10
		scale += Vector2(valor_moeda, valor_moeda)
		print(valor_moeda)

	if Input.is_action_just_pressed("descer"):
		valor_moeda -= MOEDA/10
		scale -= Vector2(valor_moeda, valor_moeda)
		print(valor_moeda)


func bounce(force: float):
	velocity.y = force
