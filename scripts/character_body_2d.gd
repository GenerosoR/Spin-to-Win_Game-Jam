extends CharacterBody2D


var player

@onready var sprite_2d: Sprite2D = $Sprite2D
var direction: Vector2
var speed = 300.0




func _ready() -> void: 
	player = get_tree().get_first_node_in_group("grupo1")
	get_tree().create_timer(2).timeout.connect(queue_free)
	
func _physics_process(delta: float) -> void:
	if direction:
		global_position += direction * speed * delta
		look_at(player.global_position + direction)

func _on_stone_body_entered(body: Node2D) -> void:
	if body.is_in_group("grupo1"):
		get_tree().reload_current_scene()
	queue_free()
