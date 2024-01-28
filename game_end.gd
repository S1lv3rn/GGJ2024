extends CanvasLayer

var game_over = false
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _process(delta):
	if Input.is_action_pressed("enter") and visible == true:
		if PlayerDetails.stage == 4:
			get_tree().change_scene_to_file("res://main_menu.tscn")
		else:
			get_tree().change_scene_to_file("res://main_game.tscn")

func displayResult(result):
	if !result:
		%GameEndLabel.text = "You suck >:("
		visible = true
	
	if result:
		%GameEndLabel.text = "What a funny guy :D"
		PlayerDetails.kings_mood += 1
		visible = true
		
		
func gameEnd(hasWon):
	if hasWon:
		%GameEndLabel.text = "Your Made Him Laugh!"
		visible = true
	else:
		%GameEndLabel.text = "GAME OVER"
		visible = true
