extends Area2D

@onready var game_manager: Node = %GameManager


func _ready() -> void:
	pass 
	
	
func _process(delta: float) -> void:
	if GameManager.completo == true:
		queue_free()
func _on_body_entered(body: Node2D) -> void:
	print("ok")
