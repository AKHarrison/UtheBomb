extends CharacterBody2D

var health = 3 
  # Reference to the Flurp2D sprite
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var dead_flurp = preload("res://Scenes/DeadGalump.tscn")
@onready	 var target_to_chase = get_node("/root/UTB/player")


const SPEED = 45.0

func _ready() -> void:
	set_physics_process(false)
	call_deferred("wait_for_physics")
	
func wait_for_physics():
	await get_tree().physics_frame
	set_physics_process(true)

func _physics_process(delta: float) -> void:

	navigation_agent.target_position = target_to_chase.global_position
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
	move_and_slide()

func kill_flurp():
	var flurp_body = dead_flurp.instantiate()
	flurp_body.global_position = global_position
	get_tree().get_root().add_child(flurp_body)

func take_damage():
	health -= 1
	
	if health == 0:
		queue_free()
		kill_flurp()

 
