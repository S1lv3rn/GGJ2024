extends Area2D
const SPEED = 400

func _physics_process(delta):
	position.y += SPEED * delta
	
