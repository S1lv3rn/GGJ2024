extends Node
const RIGHT = '00ff04'
const WRONG = 'ff0004'
const EMPTY = '787878'
const SCOREBTN = preload("res://scorebtn.tscn")
var rectArr = []


func _ready():
	var rectPosition = Vector2(0,0)
	
	for i in range(5):
		var rect = SCOREBTN.instantiate()
		rect.modulate = EMPTY
		rect.position = rectPosition
		rectArr.append(rect)
		add_child(rect)
		rectPosition.x += 35

func displayScore(scoreArr):
	for i in range(scoreArr.size()):
		if scoreArr[i] == 1:
			rectArr[i].modulate = RIGHT
		elif scoreArr[i] == 2:
			rectArr[i].modulate = WRONG
		else:
			rectArr[i].modulate = EMPTY

