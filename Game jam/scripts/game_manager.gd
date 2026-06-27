extends Node

var score = 0
var objetivo = 0
var completo = false
@export var display: Display
signal display_point(newScore) 

func add_point(): 
	score -= 1 
	print("coins collected: ", score)
	display_point.emit(score)
	
func set_objetivo(valor):
	objetivo = valor
	score = valor
	completo = false
	display_point.emit(objetivo)
func completar_objetivo():
	objetivo -= 1
	
	if objetivo <= 0:
		completo = true
		print("Fase completa!")

func _ready():
	score = 0
