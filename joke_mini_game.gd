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
		kingQ = "Scissors"
		
	%KingsTalk.text = kingQ
	
	%NextButton.visible = false
	%Button2.visible = true
	%Button3.visible = true
	%Button4.visible = true
	%Button1.visible = true
	%Button2.text = "Scissors"
	%Button3.text = "Rock"
	%Button4.text = "Paper"
	%Button1.text = "Paper"

# on button 
func check_answer(answer):
	var isRight = (kingQ == "Paper" and answer == "Scissors"
		or kingQ == "Scissors" and answer == "Rock"
		or kingQ == "Rock" and answer == "Paper")
	var reply
	
	%Button2.visible = false
	%Button3.visible = false
	%Button4.visible = false
	%Button1.visible = false
	
	if isRight:
		rightAns +=1
		reply = "Correct!"
	else:
		reply = "Wrong!"
		
	%KingsTalk.text = reply
	%NextButton.visible = true

#func _on_button_2_pressed():
	#check_answer(Button2.text)
#	pass
