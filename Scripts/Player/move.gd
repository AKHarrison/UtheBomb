extends State


@export var idle_state: State
@export var anim : AnimationPlayer
@export var anim2 : AnimationPlayer

func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left","ui_right", "ui_up", "ui_down")
	
	if input_direction != Vector2.ZERO:
		parent.velocity = input_direction.normalized() * move_speed
		anim.play("down")

	parent.move_and_slide()
