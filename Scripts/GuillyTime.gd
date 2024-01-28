extends MarginContainer

var mrGuilly
var finishLabel 

# Called when the node enters the scene tree for the first time.
func _ready():

	mrGuilly=$MonsieurGuilly
	finishLabel=$LabelFinishHim
	finishLabel.text = "Finish Him"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tickle()
	pass
	
func tickle():
	if(mrGuilly.isKo):
		finishLabel.text = "You WIN ! "
	pass

