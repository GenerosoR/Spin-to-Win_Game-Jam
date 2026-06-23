extends TileMap
@onready var mapa: TileMap = $"."

func _ready() -> void:
	pass
	print(mapa)

func _process(delta: float) -> void:
	if Input.is_action_pressed("girar_tras"):
		rotation_degrees -= 1
	if Input.is_action_pressed("girar_frente"):
		rotation_degrees += 1
