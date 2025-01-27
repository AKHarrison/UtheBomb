extends State


@export
var idle_state: State


func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left","ui_right", "ui_up", "ui_down")
	
	if input_direction != Vector2.ZERO:
		parent.velocity = input_direction.normalized() * move_speed
		
	else:
		parent.velocity = Vector2.ZERO
	parent.move_and_slide()
