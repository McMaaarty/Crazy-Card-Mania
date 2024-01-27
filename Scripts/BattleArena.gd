extends MarginContainer

var label
var selectedCard
var isPlaying:bool

var card1
var card2
var card3
var card4

var hoverCard1:bool
var hoverCard2:bool
var hoverCard3:bool
var hoverCard4:bool

var adversaire:Array

var normal_scale:float = 1
var high_scale:float = 1.5

var eraseEffect = load("res://Scenes/Effects/CardDestroyedEffect.tscn")
var winEffect = load("res://Scenes/Effects/ConfettiPartyEffect.tscn")

func _ready():	
	card1 = $Node2D/Card1
	card2 = $Node2D/Card2
	card3 = $Node2D/Card3
	card4 = $Node2D/Card4
	label = $CenterContainer/Label
	
	adversaire.append($NodeAdversaire/CardAversaire1)
	adversaire.append($NodeAdversaire/CardAversaire2)
	adversaire.append($NodeAdversaire/CardAversaire3)
	adversaire.append($NodeAdversaire/CardAversaire4)
	adversaire.shuffle()
	
	changePrompt("Le matin quand je me lêve ce que je préfère c'est ...")	
	setupScene()

func _process(delta):
	handleHoverCard()

func changePrompt(prompt):
	label.text = prompt

func changeCardScale(card, scaleValue):
	if(card != null):
		card.scale.x = scaleValue
		card.scale.y = scaleValue
	
func handleHoverCard():
	
	if(card4 != null && hoverCard4 && !hoverCard3):
		changeCardScale(card4, high_scale)
			
	if(card3 != null && hoverCard3 && !hoverCard4 && !hoverCard2):
		changeCardScale(card3, high_scale)
	
	if(card2 != null && hoverCard2 && !hoverCard3 && !hoverCard1):
		changeCardScale(card2, high_scale)
	
	if(card1 != null && hoverCard1 && !hoverCard2):
		changeCardScale(card1, high_scale)

func _on_card_1_mouse_entered_area():
	hoverCard1 = true;

func _on_card_1_mouse_exited_area():
	hoverCard1 = false;
	changeCardScale(card1, normal_scale)

func _on_card_2_mouse_entered_area():
	hoverCard2 = true;

func _on_card_2_mouse_exited_area():
	hoverCard2 = false;
	changeCardScale(card2, normal_scale)

func _on_card_3_mouse_entered_area():
	hoverCard3 = true;

func _on_card_3_mouse_exited_area():
	hoverCard3 = false;
	changeCardScale(card3, normal_scale)

func _on_card_4_mouse_entered_area():
	hoverCard4 = true;

func _on_card_4_mouse_exited_area():
	hoverCard4 = false;
	changeCardScale(card4, normal_scale)

func _on_card_1_button_clic():
	if(!isPlaying):
		hoverCard1 = false
		instanciateEffect(card1)

func _on_card_2_button_clic():
	if(!isPlaying):
		hoverCard2 = false
		instanciateEffect(card2)

func _on_card_3_button_clic():
	if(!isPlaying):
		hoverCard3 = false
		instanciateEffect(card3)

func _on_card_4_button_clic():
	if(!isPlaying):
		hoverCard4 = false
		instanciateEffect(card4)

func instanciateEffect(card):
	var instance = eraseEffect.instantiate()
	instance.position = Vector2(card.position.x + card.size.x, card.position.y + card.size.y)
	add_child(instance)
	instance.start_emitting()
	card.queue_free()
	isPlaying = true
	$Timer.start()
	
	var nodeAdversaire = $NodeAdversaire
	
	var carte = adversaire.pop_back()
	var instanceAdversaire = eraseEffect.instantiate()
	
	instanceAdversaire.position = Vector2(carte.position.x + nodeAdversaire.position.x, carte.position.y + nodeAdversaire.position.y)
	add_child(instanceAdversaire)
	instanceAdversaire.start_emitting()
	carte.queue_free()

func setupScene():
	$Node2D/AnimationPlayer.play("setup_cards_animation")

func setupWin():
	changePrompt("Bravo ! C'est la victoire !")
	$ConfettiPartyEffect.start_emitting()
	$ConfettiPartyEffect2.start_emitting()
	$ConfettiPartyEffect3.start_emitting()
	
func setupLoose():
	changePrompt("Oups.. C'est le bide")
	$ConfettiPartyEffect.start_emitting_alternatif()
	$ConfettiPartyEffect2.start_emitting_alternatif()
	$ConfettiPartyEffect3.start_emitting_alternatif()

func _on_timer_timeout():
	isPlaying = false
