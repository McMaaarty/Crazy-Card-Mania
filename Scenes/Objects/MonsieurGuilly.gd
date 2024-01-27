extends Node2D

@export var isKo = false;
var totalHP = 1000;
var maxRandom = 20;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	isKo=testKO()
	pass


func _on_button_ventre_button_down():
	reduceHP()
	pass # Replace with function body.


func _on_button_cote_g_button_down():
	reduceHP()
	pass # Replace with function body.


func _on_button_cote_d_button_down():
	reduceHP()
	pass # Replace with function body.


func _on_button_aisselle_g_button_down():
	reduceHP()
	pass # Replace with function body.


func _on_button_aisselle_d_button_down():
	reduceHP()
	pass # Replace with function body.

func testKO():
	return totalHP <=0

func reduceHP():
	totalHP = totalHP-randi() % maxRandom
