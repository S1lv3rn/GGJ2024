extends Node2D

# 1 disply the kings talk - randomised
# 2 display possible answers
# 3 if button is clicked, disable and check answer
# 4 show correct response 
# 5 enable butthons and goto 1


func _ready():
	chooseQuestion()

func chooseQuestion():
	var questionNum = randi_range(1,3)
	
	if questionNum == 1:
		%KingsTalk.text = "Rock"
	elif questionNum == 2:
		%KingsTalk.text = "Paper"
	else:
		%KingsTalk.text = "Sissors"
		

# on button 


func _on_button_2_pressed():
	pass # Replace with function body.
