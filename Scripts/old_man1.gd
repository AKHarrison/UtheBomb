extends CharacterBody2D

var special_health = 1
var health = 3 
  # Reference to the Flurp2D sprite
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var dead_flurp = preload("res://Scenes/mob_old_man_idle1.tscn")
@onready var target_to_chase = get_node("/root/Game/UTB/player")
@onready var start: PathFollow2D = %Start


const SPEED = 45.0

func _ready() -> void:
	set_physics_process(false)
	call_deferred("wait_for_physics")
	
func wait_for_physics():
	await get_tree().physics_frame
	set_physics_process(true)
	
func mob_target():
	navigation_agent.target_position = target_to_chase.global_position
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
	move_and_slide()
	
	
func _physics_process(delta: float) -> void:
	mob_target()


func kill_flurp():
	queue_free()
	var flurp_body = dead_flurp.instantiate()
	flurp_body.global_position = global_position
	get_tree().get_root().add_child(flurp_body)

	
	
func change_state_twat():
		pass	

func change_state_divvy():
		pass

func change_state_numpty():
		kill_flurp()
