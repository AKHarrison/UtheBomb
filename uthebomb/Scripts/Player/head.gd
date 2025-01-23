extends Area2D



var ammo_types = [
	preload("res://Scenes/pickle.tscn"),
	preload("res://Scenes/pinkpickle.tscn"),
	]
	
var insult_types = [
	preload("res://Scenes/insult.tscn"),
	preload("res://Scenes/insult2.tscn"),
	preload("res://Scenes/insult3.tscn")
] 
var current_ammo_index = 0
var current_insult_index = 0

const AMMO_DAMAGE = 0.5
const INSULT_DAMAGE = 0.1


func _ready():
	GlobalAutoload.timer.timeout.connect(_physics_process)

func _input(event):
	if event.is_action_pressed("ui_fire"):
		shoot()
	elif event.is_action_pressed("ui_insult"):
		insult()
		
	elif event.is_action_pressed("ui_ammo"):
		change_ammo()
		

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
		GlobalAutoload.timer.paused = false
	else: 
		GlobalAutoload.timer.paused = true
		
	
			



func shoot():
	var ammo_scene = ammo_types[current_ammo_index]
	var new_ammo = ammo_scene.instantiate()
	new_ammo.global_position = %Mouth.global_position
	new_ammo.global_rotation = %Mouth.global_rotation
	%Mouth.add_child((new_ammo))
	
func insult():
	var insult_scene = insult_types.pick_random()
	var new_insult = insult_scene.instantiate()
	new_insult.global_position = %Mouth.global_position
	new_insult.global_rotation = %Mouth.global_rotation
	%Mouth.add_child((new_insult))
	
func change_ammo():
	current_ammo_index = (current_ammo_index + 1) % ammo_types.size()





					   # shoot using space bar
	
