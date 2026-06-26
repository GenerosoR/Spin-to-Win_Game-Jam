extends Area2D

@onready var game_manager: Node = %GameManager

func _ready() -> void:
	pass 
	
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body: Node2D) -> void:
	print(game_manager.score)
	print("ok")
	if game_manager.score == 3:
		queue_free()
