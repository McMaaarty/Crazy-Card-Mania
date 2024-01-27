extends Node

var playerCardIds = []
var inventoryCardIds = {}
var allCards = {}
var fartSounds = []


func _ready():
	allCards = load_json_file("res://Assets/data/datas.json")
	loadFarts()
	print(load_by_id("questions", 5))
	print(get_values_by_promptIds(2,1))
	
	# init à la zob pour tester
	playerCardIds=["1", "2", "3"]
	inventoryCardIds=["4"]

func load_by_id(listTarget : String, answer_id: int) -> String:
	var dict = allCards[listTarget]
	for key in dict:
		if answer_id == dict[key]:
			return key
	return "Valeur non trouvé dans le dictionnaire : " + listTarget


func get_values_by_promptIds(prompt_id: int, answer_id: int) -> int:
	var values = allCards["Values"]
	for value in values:
		if value["PromptId"] == prompt_id and value["AnswerId"] == answer_id:
			return value["Value"]
	return -1

func load_json_file(filePath : String):
	if FileAccess.file_exists(filePath):
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		dataFile.close()
		return parsedResult
	print("Error parsing file")
	return null

func loadFarts():
	var fart1 = load("res://Assets/Sounds/Fart1.mp3")
	var fart3 = load("res://Assets/Sounds/Fart3.mp3")
	var fart4 = load("res://Assets/Sounds/Fart4.mp3")
	var fart5 = load("res://Assets/Sounds/Fart5.mp3")
	var fart6 = load("res://Assets/Sounds/Fart6.mp3")
	var fart7 = load("res://Assets/Sounds/Fart7.mp3")
	var fart8 = load("res://Assets/Sounds/Fart8.mp3")
	var fart9 = load("res://Assets/Sounds/Fart9.mp3")
	
	fartSounds = [fart1, fart3, fart4, fart5, fart6, fart7, fart8, fart9]

func get_random_fart():
	pass
