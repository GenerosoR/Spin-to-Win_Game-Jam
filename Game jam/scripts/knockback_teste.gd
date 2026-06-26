extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
@export var bounce_force: float = 700.0
@export var upward_force: float = 600.0
@onready var player_node: CharacterBody2D = get_parent().get_node("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var offset = body.global_position - global_position
		
		# bateu mais na horizontal
		if abs(offset.x) > abs(offset.y):
			body.velocity.x = sign(offset.x) * bounce_force
			body.velocity.y = -200
		
		# bateu em cima
		else:
			body.velocity.y = -bounce_force
		
