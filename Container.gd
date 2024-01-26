extends Container
const RIGHT = '00ff04'
const WRONG = 'ff0004'
const EMPTY = '787878'
var rectArr = []

func _ready():
	for i in range(5):
		var rect = ColorRect.new()
		rect.color = EMPTY
		rectArr.append(rect)
		add_child(rect)

func displayScore(scoreArr):
	for score in scoreArr:
		var rect = ColorRect.new()
		if score == 1:
			rect.color = RIGHT
		elif score == 2:
			rect.color = WRONG
		else:
			rect.color = EMPTY
		
	pass
