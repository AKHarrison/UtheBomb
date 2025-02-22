# Base class for different player states in a state machine system
class_name State
extends Node

# Name of the animation associated with this state
@export
var animation_name: String

# Movement speed for this state (if applicable)
@export
var move_speed: float = 200

# Reference to the parent (usually the Player) so the state can control it
var parent: Player

# Called when entering this state
func enter() -> void:
	pass  # This function can be overridden to start animations or reset variables

# Called when exiting this state
func exit() -> void:
	pass  # Can be overridden to stop animations or clean up state-specific logic

# Processes player input (e.g., key presses)
# Returns a new State if a transition is needed, otherwise returns null
func process_input(event: InputEvent) -> State:
	return null  # Override this in child states to handle input changes

# Processes per-frame logic that is not physics-related (e.g., animations)
# Returns a new State if a transition is needed, otherwise returns null
func process_frame(delta: float) -> State:
	return null  # Override this in child states for per-frame updates

# Processes physics-related updates (e.g., movement, collisions)
# Returns a new State if a transition is needed, otherwise returns null
func process_physics(delta: float) -> State:
	return null  # Override this in child states to handle physics behavior
