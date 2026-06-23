extends Node2D

@onready var main_buttons: Control = $main_buttons
@onready var opcoes: Panel = $opcoes

var button_type = null

# Called when the node enters the scene tree for the first time.
func _ready():
	main_buttons.visible = true
	opcoes.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed():
	button_type = "start"
	$fade_transition.show()
	$fade_transition/fade_timer.start()
	$fade_transition/AnimationPlayer.play("fade_in")


func _on_config_pressed():
	button_type = "options"
	main_buttons.visible = false
	opcoes.visible = true


func _on_quit_pressed():
	get_tree().quit()


func _on_fade_timer_timeout():
	if button_type == "start":
		get_tree().change_scene_to_file("res://scenes/mundo.tscn")


func _on_back_opcoes_pressed() -> void:
		main_buttons.visible = true
		opcoes.visible = false
