extends Area2D



var twat = preload("res://Scenes/insult.tscn")
var divvy = preload("res://Scenes/insult2.tscn")
var numpty = preload("res://Scenes/insult3.tscn") 
var current_ammo_index = 0
var current_insult_index = 0

const AMMO_DAMAGE = 0.5
const INSULT_DAMAGE = 0.1


func _input(event):
	if event.is_action_pressed("ui_A"):
		insult_twat()
	elif event.is_action_pressed("ui_X"):
		insult_divvy()
	elif event.is_action_pressed("ui_Y"):
		insult_numpty()
		
func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		var target_position = target_enemy.global_position
		look_at(target_enemy.global_position)
		
		var angle_to_target = (target_position - global_position).angle()  		# Calculate the angle between the current position and the target
		rotation = lerp_angle(rotation, angle_to_target, delta * 5)   # ensures smoother roatation through interpolation can adjuust r

	
func insult_twat():
	var insult_scene = twat
	var new_insult = insult_scene.instantiate()
	new_insult.global_position = %Mouth.global_position
	new_insult.global_rotation = %Mouth.global_rotation
	%Mouth.add_child((new_insult))
	
func insult_divvy():
	var insult_scene = divvy
	var new_insult = insult_scene.instantiate()
	new_insult.global_position = %Mouth.global_position
	new_insult.global_rotation = %Mouth.global_rotation
	%Mouth.add_child((new_insult))

func insult_numpty():
	var insult_scene = numpty
	var new_insult = insult_scene.instantiate()
	new_insult.global_position = %Mouth.global_position
	new_insult.global_rotation = %Mouth.global_rotation
	%Mouth.add_child((new_insult))





					   # shoot using space bar
	
