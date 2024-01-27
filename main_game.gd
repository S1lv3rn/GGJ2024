extends Node2D

var moodMax = 3

var txtInx = 0
var i
var stg1Txt = ["You got summoned to the COURT but the KING is in a BAD MOOD!", 
					"To save your head you gotta...",
					"MAKE", "MAKE HIM", "MAKE HIM LAUGH!"]

var stg2GoodTxt = ["His Magesty seems amused!", 
						"He's chuckling slightly!", 
						"You have keep it up! Let's...",
<<<<<<< Updated upstream
						"MAKE", "MAKE HIM", "MAKE HIM LAUGH"]
var stg2BadTxt = ["His Majesty doesn't seem impressed", "Better step it up next time...", 
							"You really"]
=======
						"MAKE", "MAKE HIM", "MAKE HIM LAUGH!"]
var stg2BadTxt = ["His Magesty doesn't seem impressed", "Better step it up next time...", 
						"You really need to...",
						"MAKE", "MAKE HIM", "MAKE HIM LAUGH!"]
>>>>>>> Stashed changes


var stg3GoodTxt = ["The King is roaring with laughter!", "Looks like you'll keep you head another day!"]
var stg3MidTxt = ["Another mixed perfomace...", "You barely managed to amunse the King", "The afternoon session may not be so lucky..."]
var stg3BadTxt = ["The king is still angry and doen't like that you made light of the situation", "You may not be going to court tomorrow", "You may be going anywhere at all..."]

var test = [{"txtArr": stg1Txt, "nxtScene": "res://joke_game.tscn"},
			{"txtArr": stg2GoodTxt, "nxtScene": "res://fallingBalls/falling_balls.tscn"},
			{"txtArr": stg2BadTxt, "nxtScene": "res://fallingBalls/falling_balls.tscn"},
			{"txtArr": stg3GoodTxt, "nxtScene": "res://main_menu.tscn"},
			{"txtArr": stg3MidTxt, "nxtScene": "res://main_menu.tscn"},
			{"txtArr": stg3BadTxt, "nxtScene": "res://main_menu.tscn"}]

func _ready():
	$ProgressBar.value = PlayerDetails.kings_mood
	$Jesture.isMoving = false
	txtInx = 0
	if PlayerDetails.stage == 0:
		i = 0
	elif PlayerDetails.stage == 1 and PlayerDetails.kings_mood == 2:
		i = 1
	elif PlayerDetails.stage == 1:
		i = 2
	elif PlayerDetails.kings_mood == 3:
		i = 3
	elif PlayerDetails.kings_mood == 2:
		i = 4
	else:
		i = 5
	

# display lore txt
# update score

func nextText():
	if txtInx < test[i].get("txtArr").size():
		$TextBox.text = test[i].get("txtArr")[txtInx]
		txtInx += 1
	else:
		PlayerDetails.stage +=1
		get_tree().change_scene_to_file(test[i].get("nxtScene"))
			
	

func _on_button_pressed():
	nextText()
