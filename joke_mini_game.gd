extends Node2D

# 1 disply the kings talk - randomised
# 2 display possible answers
# 3 if button is clicked, disable and check answer
# 4 show correct response 
# 5 enable butthons and goto 1


func _ready():
	%Button2.visible = false
	%Button3.visible = false
	%Button4.visible = false
	%Button5.visible = false
	chooseQuestion()

func chooseQuestion():
	var questionNum = randi_range(1,3)
	
	if questionNum == 1:
		%KingsTalk.text = "Rock"
	elif questionNum == 2:
		%KingsTalk.text = "Paper"
	else:
		%KingsTalk.text = "Sissors"
		
	%Button2.visible = true
	%Button3.visible = true
	%Button4.visible = true
	%Button5.visible = true
	%Button2.text = "button2"
	%Button3.text = "button3"
	%Button4.text = "button4"
	%Button5.text = "button1"

# on button 


func _on_button_2_pressed():
	pass # Replace with function body.
