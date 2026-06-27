extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var tocou = false

const FILE_BEGIN = "res://scenes/levels/level"
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.completo == true and tocou == false:
		$AnimatedSprite2D.play("opening")
		tocou = true
	



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		
		var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
		if GameManager.completo == true:
			get_tree().change_scene_to_file(next_level_path)
