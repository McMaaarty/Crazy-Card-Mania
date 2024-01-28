extends MarginContainer

var inventoryList
var playerList

# Called when the node enters the scene tree for the first time.
func _ready():
	var cardInventory = preload("res://Scenes/Objects/CardInventory.tscn")
	inventoryList = get_node("BoxContainer/ScrollContainer/InvenoryHBox")
	playerList = get_node("BoxContainer/ScrollContainer2/PlayerHBox")
	
	for id in StaticData.inventoryCardIds:
		var cardInventoryInst = cardInventory.instantiate()
		cardInventoryInst.pressed.connect(moveToPlayer.bind(cardInventoryInst))
		inventoryList.add_child(cardInventoryInst)
	
	for id in StaticData.playerCardIds:
		var cardInventoryInst = cardInventory.instantiate()
		cardInventoryInst.pressed.connect(moveToInventory.bind(cardInventoryInst))
		playerList.add_child(cardInventoryInst)
	

func moveToPlayer(cardInventoryInst):
	cardInventoryInst.pressed.disconnect(moveToPlayer)
	inventoryList.remove_child(cardInventoryInst)
	playerList.add_child(cardInventoryInst)
	cardInventoryInst.pressed.connect(moveToInventory.bind(cardInventoryInst))

func moveToInventory(cardInventoryInst):
	cardInventoryInst.pressed.disconnect(moveToInventory)
	playerList.remove_child(cardInventoryInst)
	inventoryList.add_child(cardInventoryInst)
	cardInventoryInst.pressed.connect(moveToPlayer.bind(cardInventoryInst))
	


