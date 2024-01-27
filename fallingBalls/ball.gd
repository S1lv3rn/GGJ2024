extends Area2D
const SPEED = 400
signal addScore

func _physics_process(delta):
	position.y += SPEED * delta
	

