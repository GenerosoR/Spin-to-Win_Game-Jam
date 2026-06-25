extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var player_node: CharacterBody2D = get_parent().get_node("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("apply_knockback"):
		var dir = (body.global_position - global_position).normalized()
		dir.y = -0.7

		body.apply_knockback(dir, 250, 0.20)
