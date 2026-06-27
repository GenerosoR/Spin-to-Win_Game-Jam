extends Node

var score = 0
var objetivo = 0
var completo = false


func add_point():
	score += 1
	print("Coins: ", score)


func completar_objetivo():
	objetivo -= 1

	if objetivo <= 0:
		objetivo = 0
		completo = true
		print("Fase completa!")


func set_objetivo(valor):
	objetivo = valor
	completo = false
