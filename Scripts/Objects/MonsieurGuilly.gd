extends Node2D

@export var isKo = false;
var totalHP = 300;
var maxRandom = 30;
var explosion;


var ventre;
var coteD;
var coteG;
var aisselleG;
var aisselleD;

var lastButton;

var sceneTest
# Called when the node enters the scene tree for the first time.
func _ready():
	explosion = preload("res://Scenes/Effects/Explosion.tscn")
	
	ventre = $Area2D/CollisionPolygon2D/ButtonVentre
	coteD = $Area2D/CollisionPolygon2D/ButtonCoteD
	coteG = $Area2D/CollisionPolygon2D/ButtonCoteG
	aisselleG= $Area2D/CollisionPolygon2D/ButtonAisselleG
	aisselleD = $Area2D/CollisionPolygon2D/ButtonAisselleD
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	isKo=testKO()
	pass


func _on_button_ventre_button_down():
	reduceHP(ventre)
	pass # Replace with function body.


func _on_button_cote_g_button_down():
	reduceHP(coteG)
	pass # Replace with function body.


func _on_button_cote_d_button_down():
	reduceHP(coteD)
	pass # Replace with function body.


func _on_button_aisselle_g_button_down():
	reduceHP(aisselleG)
	pass # Replace with function body.


func _on_button_aisselle_d_button_down():
	reduceHP(aisselleD)
	pass # Replace with function body.

func testKO():
	return totalHP <=0

func disableCurrentButton(currentButton):
	currentButton.disabled=true
	lastButton = currentButton

func enablePreviousButton():
	lastButton.disabled = false

func reduceHP(currentButton):
	totalHP = totalHP-randi() % maxRandom
	startLaugh()
	startAnimation()
	enablePreviousButton()
	disableCurrentButton(currentButton)

func startLaugh():
	$AudioPlayer.stream = StaticData.get_random_fart()
	$AudioPlayer.play()	
	
func startAnimation():
	var explose = explosion.instantiate()
	add_child(explose)
	explose.position = get_global_mouse_position() - explose.get_parent().position
	explose.start_emitting()
	pass
	
