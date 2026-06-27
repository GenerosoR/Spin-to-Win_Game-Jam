extends Node2D
class_name Display
@onready var digit: Label = $digit
@onready var game_manager: Node = %GameManager

func contador(newScore):
	digit.text = str(newScore)
	print(newScore)

func _ready():
	GameManager.display_point.connect(contador)
