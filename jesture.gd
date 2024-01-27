extends Area2D
var isMoving = false
const SPEED = 800.0
var stage = 0

func _physics_process(delta):
	if isMoving:
		var direction = Input.get_vector("left","right","up", "down")
		position += direction * SPEED * delta
	

func _on_area_entered(area):
	if area.is_in_group("ball"):
		area.queue_free()
