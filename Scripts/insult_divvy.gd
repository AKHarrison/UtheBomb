extends Area2D

var travelled_distance = 0

func _physics_process(delta):
	const SPEED = 700
	const RANGE = 800
	
	var direction = Vector2.UP.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()
		


func _on_body_entered(body):
	queue_free()
	if body.has_method("change_state_divvy"):
		body.change_state_divvy()
