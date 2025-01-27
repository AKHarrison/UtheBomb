extends State


@export
var move_state: State

func enter() -> void:
	super()
	parent.velocity.x = 0


func process_input(event: InputEvent) -> State:
	var input_vector = Vector2(
		Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left'),
		Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
	)

	if input_vector != Vector2.ZERO:
		return move_state  # Return move state if there's movement input


	return null
