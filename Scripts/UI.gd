extends CanvasLayer

var coins = 0
var heart1
var heart2
var heart3

func _ready():
	heart1 = get_node("Hearts1")
	heart2 = get_node("Hearts2")
	heart3 = get_node("Hearts3")
	
	var coinNode = get_tree().get_nodes_in_group("Coin2D")
	for coin in coinNode:
		coin.connect("coinCollected", handleCoinCollected)
	$CoinsCollected.text = str(coins)
	
func handleCoinCollected():
	print("Coin Collected")
	coins += 1
	$CoinsCollected.text = str(coins)
	
	if coins == 3:
		##get_tree().change_scene_to_file("res://Scenes/World2.tscn")
		var s = str(int(get_tree().current_scene.name.get_basename().get_slice("/",3))+1)
		var scene = "res://Scenes/World"+s+".tscn"
		print(scene)
		get_tree().change_scene_to_file(scene)

func handleHearts(lifes):
	match lifes:
		0:
			heart1.visible = false
		1:
			heart2.visible = false
		2:
			heart3.visible = false
