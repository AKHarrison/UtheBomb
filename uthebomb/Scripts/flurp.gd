extends CharacterBody2D

var health = 3 
  # Reference to the Flurp2D sprite
@onready var player = get_node("/root/UTB/player")

func _physics_process(delta):
	var distance = global_position.direction_to(player.global_position)

	velocity = distance * 100.00

	move_and_slide()


func take_damage():
	health -= 1
	
	if health == 0:
		queue_free()
