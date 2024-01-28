extends Node2D

var isNotPaused = true
var penaty = []

func _ready():
	%bgm.play()
	$Jesture.isMoving = true
	get_tree().paused = false

func _physics_process(delta):
	$KingTimer/ProgressBar.value = $KingTimer.time_left
	

func spawn_ball():
	var new_ball = preload("res://fallingBalls/ball.tscn").instantiate()
	$BallSpawnerPath/BallSpawner.progress_ratio = randf()
	new_ball.global_position = $BallSpawnerPath/BallSpawner.global_position
	add_child(new_ball)


func _on_ball_timer_timeout():
	if isNotPaused:
		spawn_ball()



func _on_floor_area_entered(area):
	if area.is_in_group("ball") and isNotPaused:
		area.queue_free()
		penaty.append(2)
		%boo.play()
		$PointsList.displayScore(penaty)
		
		if penaty.size() == 5:
			isNotPaused = false
			$KingTimer.stop()
			$GameEnd.displayResult(false)
			
	pass



func _on_king_timer_timeout():
	isNotPaused = false
	$KingTimer.stop()
	$GameEnd.displayResult(true)
