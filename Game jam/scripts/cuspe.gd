extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sfx_death: AudioStreamPlayer2D = $sfx_death

var direction: Vector2
var speed = 300.0

func _ready() -> void:
	get_tree().create_timer(2).timeout.connect(queue_free)

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		global_position += direction * speed * delta
		rotation = direction.angle()





func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
		
	queue_free()
