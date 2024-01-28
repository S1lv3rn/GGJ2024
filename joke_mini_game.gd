extends Node2D

# 1 disply the kings talk - randomised
# 2 display possible answers
# 3 if button is clicked, disable and check answer
# 4 show correct response 
# 5 enable butthons and goto 1
var answer_arr  = []
var kingQ
var rightAns = 0
var questionNo = 0
var userAnswers = [0,0,0,0,0]
var answers = ["A Brick", "A Yellow Brick", "A Blue Brick", "A Stick"]
var questions = ["What’s red and bad for your teeth?","What's yellow and bad for your teeth?",
				 "What's blue and bad for your teeth?","What's brown and sticky",
				 "What's brown and bad for your teeth?"]
var possibleAnswers = []

func _ready():
	setUpQuestions()
	chooseQuestion()

func _physics_process(delta):
	%TimeBar.value = %Timer.time_left
	
func chooseQuestion():
	%Timer.start()
	%TimeBar.visible = true
	var questionNum = randi_range(0,4)
	
	kingQ = questions[questionNum]
	
	%KingsTalk.text = kingQ
	%NextButton.visible = false
	%Button2.visible = true
	%Button3.visible = true
	%Button4.visible = true
	%Button1.visible = true
	
	%Button1.text = possibleAnswers[questionNum][0]
	%Button2.text = possibleAnswers[questionNum][1]
	%Button3.text = possibleAnswers[questionNum][2]
	%Button4.text = possibleAnswers[questionNum][3]

# on button 
func check_answer(answer):
	%Timer.stop()
	%TimeBar.visible = false
	var isRight = answer in answers
	var reply
	
	%Button2.visible = false
	%Button3.visible = false
	%Button4.visible = false
	%Button1.visible = false
	
	if isRight:
		rightAns +=1
		reply = "Correct!"
		userAnswers[questionNo] = 1
	else:
		reply = "Wrong!"
		userAnswers[questionNo] = 2
		
	%PointsList.displayScore(userAnswers)
	%KingsTalk.text = reply
	
	if userAnswers.count(2) >= 3:
		%GameEnd.displayResult(false)
	
	if userAnswers.count(1) >= 3:
		%GameEnd.displayResult(true)
	elif questionNo < 5:
		%NextButton.visible = true



#func _on_button_2_pressed():
	#check_answer(Button2.text)
#	pass


func _on_button_1_pressed():
	check_answer(%Button1.text)


func _on_button_2_pressed():
	check_answer(%Button2.text)

func _on_button_3_pressed():
	check_answer(%Button3.text)

func _on_button_4_pressed():
	check_answer(%Button4.text)



func _on_next_button_pressed():
	questionNo += 1
	chooseQuestion()


func _on_timer_timeout():
	%Timer.stop()
	%TimeBar.visible = false;
	%Button2.visible = false
	%Button3.visible = false
	%Button4.visible = false
	%Button1.visible = false
	var reply = "Too slow!"
	userAnswers[questionNo] = 2
	%KingsTalk.text = reply
	%NextButton.visible = true

func setUpQuestions():
	#var questionToAnswer = {"What’s red and bad for your teeth?": "A Brick",
							#"What's yellow and bad for your teeth?":"A Yellow Brick",
							#"What's blue and bad for your teeth?":"A Blue Brick",
							#"What's brown and sticky": "A stick",
							#"What's brown and bad for your teeth?":"A Brick"
							#}
	#
	var redAnswers = ["An Apple", "A Brick", "A Firetruck", "Candy"]
	var yellowAnswers = ["A Yellow Brick", "A Banana", "A Lemon", "A Warning Sign"]
	var blueAnswers = ["A Whale", "A Blue Brick", "Pepsi", "Ice"]
	var stickAnswers = ["A Stick", "A Tree", "A Sticky Brick", "Toffee"]
	var brownAnswers = ["A Stick", "A Brick", "Toffee", "Coffee"]
	
	possibleAnswers = [redAnswers, yellowAnswers, blueAnswers, stickAnswers, brownAnswers]
