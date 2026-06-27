extends Node2D

@onready var main_buttons: Control = $main_buttons
@onready var opcoes: Panel = $opcoes
@onready var button_select: AudioStreamPlayer = $ButtonSelect

var button_type = null

# Called when the node enters the scene tree for the first time.
func _ready():
	main_buttons.visible = true
	opcoes.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_fade_timer_timeout():
	if button_type == "start":
		get_tree().change_scene_to_file("res://scenes/levels/level0.tscn")

func _on_start_pressed() -> void:
	button_type = "start"
	$ButtonSelect.play()
	$fade_transition.show()
	$fade_transition/fade_timer.start()
	$fade_transition/AnimationPlayer.play("fade_in")


func _on_config_pressed() -> void:
	$ButtonSelect.play()
	button_type = "options"
	main_buttons.visible = false
	opcoes.visible = true


func _on_quit_pressed() -> void:
	$ButtonSelect.play()
	get_tree().quit()

func _on_back_2_pressed() -> void:
	$ButtonSelect.play()
	main_buttons.visible = true
	opcoes.visible = false
