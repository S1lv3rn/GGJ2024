extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


func displayResult(result):
	if !result:
		%GameEndLabel.text = "Your jokes suck"
		visible = true
	
	if result:
		%GameEndLabel.text = "What a funny guy :D"
		visible = true
