extends CharacterBody2D


  # Reference to the Flurp2D sprite
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready	 var home_point = get_node("/root/UTB/Home")
@onready	 var carpark_point = get_node("/root/UTB/Carpark")
@onready	 var market_point = get_node("/root/UTB/Market")


const SPEED = 45.0
var rng = RandomNumberGenerator.new()
var my_random_number = rng.randi_range(-1, 1) 
var timer = Timer.new()


func _ready() -> void:

	set_physics_process(false)
	call_deferred("wait_for_physics")
	
func wait_for_physics():
	await get_tree().physics_frame
	set_physics_process(true)
	
func return_home():
	navigation_agent.target_position = home_point.global_position
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
	move_and_slide()
	
func return_carpark():
	navigation_agent.target_position = carpark_point.global_position
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
	move_and_slide()
	
func return_market():
	navigation_agent.target_position = market_point.global_position
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
	move_and_slide()
	
func mob_return():
	if my_random_number == 1:
		return_home() 

	elif my_random_number == 0:
		return_carpark()

	elif my_random_number == -1:
		return_market()
		
func despawn():
	queue_free()

func _physics_process(delta: float) -> void:
	mob_return()


	
	
	#despawn()
