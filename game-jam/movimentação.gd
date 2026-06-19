extends Node
@onready var platformer := $platofmer as Sprite2D
@onready var topdown := $topdown as Sprite2D
@onready var label := $info as Label

var mode 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		
	pass
	
#func platformerMode():
	#var input_direction := int(Input.is_action_just_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
	
	#if input_direction != 0:
		#platformer.scale.x += input_direction
		#platformer.position.x += input_direction
	
	#label.txt = "X: " + str(input_direction)
	
func topdownMode():
	var input_direction := Vector2.ZERO
	input_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	input_direction = input_direction.normalized()
	
	if input_direction.x != 0:
		topdown.scale.x = input_direction.x 
		topdown.position.x += input_direction.x
	if input_direction.y != 0:
		topdown.scale.y = input_direction.y 
		topdown.position.y += input_direction.y
		
	pass
