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
	for score in scoreArr:
		var rect = ColorRect.new()
		if score == 1:
			rect.color = RIGHT
		elif score == 2:
			rect.color = WRONG
		else:
			rect.color = EMPTY

