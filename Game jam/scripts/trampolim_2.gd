extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get("jump_pad_height"):
		body.velocity.y += body.jump_pad_height
		animated_sprite_2d.play("pulo")
		



func _on_area_2d_body_exited(body: Node2D) -> void:
	animated_sprite_2d.play("idle")
