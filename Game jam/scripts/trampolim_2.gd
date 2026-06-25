extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var knockback_dir = Vector2()
var knockback_wait = 10
@export var knockback := 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	if body is CharacterBody2D:
		body.velocity.y = -700


func _on_area_2d_body_entered(body: Node2D) -> void:
		pass
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	animated_sprite_2d.play("idle")
