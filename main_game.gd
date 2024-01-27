extends Node2D

var kingMood = 1
var moodMax = 3

var index = 0
var stg1Txt = ["You got summoned to the COURT but the KING is in a BAD MOOD!", 
					"To save your head you gotta...",
					"MAKE", "MAKE HIM", "MAKE HIM LAUGH"]

var stg2GoodTxt = ["His Magesty seems amused!", 
						"He's chuckling slightly!", 
						"You have keep it up! Let's...",
						"MAKE", "MAKE HIM", "MAKE HIM LAUGH"]
var stg2BadTxt = ["His Majesty doesn't seem impressed", "Better step it up next time...", 
							"You really"]


var stg3GoodTxt = ["The King is roaring with laughter!", "Looks like you'll keep you head another day!"]
var stg3MidTxt = ["Another mixed perfomace...", "You barely managed to amunse the King", "The afternoon session may not be so lucky..."]
var stg3Badtxt = ["The king is still angry and doen't like that you made light of the situation", "You may not be going to court tomorrow", "You may be going anywhere at all..."]

var test = {}

func _ready():
	$Jesture.isMoving = false
	index = 0
	
	

# display lore txt
# update score

func nextText():
	var txtArr 
	
	if $Jesture.stage == 0:
		if index < stg1Txt.size():
			$TextBox.text = stg1Txt[index]
			index += 1
		else:
			$Jesture.stage +=1
			get_tree().change_scene_to_file("res://joke_game.tscn")
			
	elif $Jesture.stage == 1:
		if index < stg1Txt.size():
			$TextBox.text = stg1Txt[index]
			index += 1
		else:
			$Jesture.stage +=1
			get_tree().change_scene_to_file("res://joke_game.tscn")

func _on_button_pressed():
	nextText()
