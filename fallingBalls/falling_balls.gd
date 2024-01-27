extends Node2D

var penaty = []

func _physics_process(delta):
	$KingTimer/ProgressBar.value = $KingTimer.time_left
	

func spawn_ball():
	var new_ball = preload("res://fallingBalls/ball.tscn").instantiate()
	$BallSpawnerPath/BallSpawner.progress_ratio = randf()
	new_ball.global_position = $BallSpawnerPath/BallSpawner.global_position
	add_child(new_ball)


func _on_ball_timer_timeout():
	spawn_ball()


func _on_floor_area_entered(area):
	if area.is_in_group("ball"):
		area.queue_free()
		penaty.append(2)
		print(penaty)
	
		
	
		#$PointsList.
	pass
