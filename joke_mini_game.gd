extends Node2D

# 1 disply the kings talk - randomised
# 2 display possible answers
# 3 if button is clicked, disable and check answer
# 4 show correct response 
# 5 enable butthons and goto 1
var answer_arr  = []
var kingQ
var rightAns = 0

func _ready():
	chooseQuestion()

func chooseQuestion():
	var questionNum = randi_range(1,3)
	
	if questionNum == 1:
		kingQ = "Rock"
	elif questionNum == 2:
		kingQ = "Paper"
	else:
		kingQ = "Sissors"
		
	%KingsTalk.text = kingQ
		

# on button 
func check_answer(answer):
	var isRight = (kingQ == "Paper" and answer == "Sissors"
		or kingQ == "Sissors" and answer == "Rock"
		or kingQ == "Rock" and answer == "Paper")
	if isRight:
		rightAns +=1

func _on_button_2_pressed():
	#check_answer(Button2.text)
	pass
