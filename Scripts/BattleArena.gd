extends MarginContainer

var label

# Called when the node enters the scene tree for the first time.
func _ready():
	
	label = $CenterContainer/Label
	changePrompt("Super")
	
	# Pour initialiser les données au début
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# = Update
	
	pass
	
	
func changePrompt(prompt):
	label.text = prompt


func _on_card_1_mouse_entered():
	
	pass # Replace with function body.
