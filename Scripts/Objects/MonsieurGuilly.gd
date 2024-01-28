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

var hand = load("res://Assets/Sprites/OpenedHand.png")
var closedHand = load("res://Assets/Sprites/ClosedHand.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	explosion = preload("res://Scenes/Effects/Explosion.tscn")
	
	ventre = $Area2D/CollisionPolygon2D/ButtonVentre
	coteD = $Area2D/CollisionPolygon2D/ButtonCoteD
	coteG = $Area2D/CollisionPolygon2D/ButtonCoteG
	aisselleG= $Area2D/CollisionPolygon2D/ButtonAisselleG
	aisselleD = $Area2D/CollisionPolygon2D/ButtonAisselleD
	
	Input.set_custom_mouse_cursor(hand,Input.CURSOR_ARROW,Vector2(51, 51))
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	isKo=testKO()
	pass

func _on_button_ventre_button_down():
	reduceHP(ventre)

func _on_button_cote_g_button_down():
	reduceHP(coteG)

func _on_button_cote_d_button_down():
	reduceHP(coteD)

func _on_button_aisselle_g_button_down():
	reduceHP(aisselleG)

func _on_button_aisselle_d_button_down():
	reduceHP(aisselleD)

func testKO():
	return totalHP <=0

func disableCurrentButton(currentButton):
	Input.set_custom_mouse_cursor(hand,Input.CURSOR_ARROW,Vector2(51, 51))
	currentButton.disabled=true
	lastButton = currentButton

func enablePreviousButton():
	if(lastButton != null):
		lastButton.disabled = false

func reduceHP(currentButton):
	Input.set_custom_mouse_cursor(closedHand,Input.CURSOR_ARROW,Vector2(46, 38))
	totalHP = totalHP-randi() % maxRandom
	startLaugh()
	startAnimation()
	enablePreviousButton()


func startLaugh():
	$AudioPlayer.stream = StaticData.get_random_laught()
	$AudioPlayer.play()	
	
func startAnimation():
	var explose = explosion.instantiate()
	add_child(explose)
	explose.position = get_global_mouse_position() - explose.get_parent().position
	explose.start_emitting()

func _on_button_ventre_button_up():
	disableCurrentButton(ventre)


func _on_button_cote_g_button_up():
	disableCurrentButton(coteG)


func _on_button_cote_d_button_up():
	disableCurrentButton(coteD)


func _on_button_aisselle_g_button_up():
	disableCurrentButton(aisselleG)


func _on_button_aisselle_d_button_up():
	disableCurrentButton(aisselleD)
