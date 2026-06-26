extends Control

@onready var main_buttons: Control = $main_buttons
@onready var opcoes: Panel = $opcoes



var button_type = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("RESET")
	opcoes.visible = false
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		testEsc()


func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	hide()
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	show()
func testEsc():
	if Input.is_action_just_pressed("pausa") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("pausa") and get_tree().paused:
		resume()
		opcoes.visible = false


func _on_resume_pressed() -> void:
	resume()
	



func _on_opções_pressed() -> void:
	button_type = "options"
	opcoes.visible = true
	
	
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed()-> void:
		opcoes.visible = false
