extends CharacterBody2D

var special_health = 1
var health = 3 
  # Reference to the Flurp2D sprite
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var dead_flurp = preload("res://Scenes/DeadFlurp2.tscn")
@onready var home_flurp = preload("res://Scenes/HomeFlurp2.tscn")
@onready	 var target_to_chase = get_node("/root/UTB/player")
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
	var flurp_body = dead_flurp.instantiate()
	flurp_body.global_position = global_position
	get_tree().get_root().add_child(flurp_body)

func flurp_go_home():
	var returning_flurp = home_flurp.instantiate()
	returning_flurp.global_position = global_position
	get_tree().get_root().add_child(returning_flurp)
	
	
	

func take_damage():
	health -= 1
	
	if health == 0:
		queue_free()
		kill_flurp()

func return_home():
	special_health -= 1
	
	if special_health == 0:
		queue_free()
		flurp_go_home()



 
