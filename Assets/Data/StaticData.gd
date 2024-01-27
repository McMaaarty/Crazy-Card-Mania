extends Node

# Card ID
# Card text
# IsSoundEffect ?
# SoundEffect ID ?

var playerCardIds = []
var inventoryCardIds = {}
var allCards = {}

func _ready():
	allCards = load_json_file("res://Assets/data/all_cards.json")
	# init à la zob pour tester
	playerCardIds=["1", "2", "3"]
	inventoryCardIds=["4"]

	
func load_json_file(filePath : String):
	if FileAccess.file_exists(filePath):
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		dataFile.close()
		return parsedResult
	print("Error parsing file")
	return null

