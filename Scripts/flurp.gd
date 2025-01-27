extends CharacterBody2D

var health = 3 
  # Reference to the Flurp2D sprite
@onready var player = get_node("/root/UTB/player")
@onready var dead_flurp = preload("res://Scenes/DeadFlurp.tscn")

func _physics_process(delta):
	var distance = global_position.direction_to(player.global_position)

	velocity = distance * 50.00

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

 
