extends Node

var playerCardIds = []
var inventoryCardIds = {}
var allCards = {}
var fartSounds = []
var laugthSounds = []

var gamer:int = 0
var computer:int = 0

func _ready():
	allCards = load_json_file("res://Assets/Data/datas.json")
	loadFarts()
	loadLaught()
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
	print("Valeur non trouvé dans le dictionnaire : " + listTarget)
	return ""

func id_by_string(listTarget:String, label:String) -> int:
	var dict = allCards[listTarget]
	return dict[label]

func load_by_target(listTarget : String) -> Array:
	var target:Dictionary = allCards[listTarget]
	return target.keys()

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

func loadLaught():
	laugthSounds = ["hahaha", "hihihihi","houhouhou"]

func loadFarts():
	# id des noms de fichiers
	fartSounds = [1, 3, 4, 5, 6, 7, 8, 9]

func get_random_fart():
	var fartId = fartSounds.pick_random()
	return load("res://Assets/Sounds/" + get_filename_by_fartId(fartId))

func get_random_laught():
	var laughtId = laugthSounds.pick_random()
	return load("res://Assets/Sounds/" + get_filename_by_laughtId(laughtId))

func get_filename_by_fartId(fartId):
	return "Fart" + str(fartId) + ".mp3"

func get_filename_by_laughtId(laughtId):
	return str(laughtId) + ".mp3"

func reset_results():
	gamer = 0
	computer = 0

func add_point_to_gamer(points: int):
	gamer += points

func get_gamer_points() -> int:
	return gamer

func add_point_to_computer(points: int):
	computer += points

func get_computer_points() -> int:
	return computer
