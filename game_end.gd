extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _process(delta):
	if Input.is_action_pressed("enter") and visible:
		get_tree().change_scene_to_file("res://main_game.tscn")
		print("TEST")

func displayResult(result):
	if !result:
		%GameEndLabel.text = "Your jokes suck"
		visible = true
	
	if result:
		%GameEndLabel.text = "What a funny guy :D"
		visible = true
