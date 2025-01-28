class_name GameController extends Node

@export var world_2d: Node2D
@export var gui: Control
@export var transition_controller: SceneTransitionController  # Link in editor

var current_2d_scene
var current_gui_scene

func change_gui_scene(
	new_scene: String,
	delete: bool = true,
	keep_running: bool = false,
	transition_in: String = "fade_in",
	transition_out: String = "fade_out",
	seconds: float = 1.0
) -> void:
	if transition_controller:
		transition_controller.transition(transition_out, seconds)
		await transition_controller.animation_player.animation_finished
	if current_gui_scene != null:
		if delete:
			current_gui_scene.queue_free()  # Removes scene entirely
		elif keep_running:
			current_gui_scene.visible = false
		else:
			gui.remove_child(current_gui_scene)

	var new = load(new_scene).instantiate()
	gui.add_child(new)
	current_gui_scene = new
	transition_controller.transition(transition_in, seconds)

func change_2d_scene(
	new_scene: String,
	delete: bool = true,
	keep_running: bool = false,
	transition_in: String = "fade_in",
	transition_out: String = "fade_out",
	seconds: float = 1.0
) -> void:
	if transition_controller:
		transition_controller.transition(transition_out, seconds)
		await transition_controller.animation_player.animation_finished
		
		if delete:
			current_2d_scene.queue_free()  # Removes scene entirely
		elif keep_running:
			current_2d_scene.visible = false
		else:
			world_2d.remove_child(current_2d_scene)

	var new = load(new_scene).instantiate()
	world_2d.add_child(new)
	current_2d_scene = new
	transition_controller.transition(transition_in, seconds)

func _ready() -> void:

	current_gui_scene = $GUI/SplashSceneManager

func _init() -> void:
	GlobalAutoload.game_controller = self
