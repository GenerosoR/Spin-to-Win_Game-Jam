extends CharacterBody2D

# Configurações
@export var speed: float = 300.0
@export var gravity_force: float = 1200.0
@export var rotation_speed: float = 5.0 # Velocidade da rotação visual

var gravity_direction: Vector2 = Vector2.DOWN

func _physics_process(delta: float) -> void:
	# 1. Movimentação Horizontal (Relativa ao personagem)
	# Transform.x é a direção lateral do player (após rotacionado)
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity = transform.x * direction * speed
	
	# 2. Gravidade Dinâmica
	# Sempre puxa para a direção definida
	velocity += gravity_direction * gravity_force * delta
	
	# 3. Movimentação Física
	# 'up_direction' é o oposto da gravidade para o motor entender o chão
	up_direction = -gravity_direction
	move_and_slide()

# Chame esta função para rotacionar o player (ex: ao apertar uma tecla)
func rotate_player(angle_degrees: float):
	# Rotaciona visualmente o nó
	rotation_degrees += angle_degrees
	
	# Atualiza o vetor de gravidade baseado na nova rotação
	# O -PI/2 ajusta o eixo para que a "frente" do player seja o "baixo"
	gravity_direction = -Vector2.from_angle(rotation - PI/2)
	
	# Força um pequeno "empurrão" para evitar que ele fique preso na colisão
	position += gravity_direction * 2.0

# Exemplo de input para testar (adicione no seu código)
func _input(event):
	if event.is_action_pressed("girar_frente"): # Espaço por padrão
		rotate_player(90)
