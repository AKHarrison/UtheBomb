extends Area2D

@onready var timer = $Timer

var is_timer_running = false

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
const AMMO_DAMAGE = 0.5

func _ready():
	GlobalAutoload.timer.timeout.connect(_physics_process)

func _input(event):
	if event.is_action_pressed("ui_fire"):
		is_timer_running = not is_timer_running
		
		if is_timer_running:
			timer.start()
		
		else: 
			timer.stop()
			
	if event.is_action_pressed("ui_insult"):
		is_timer_running = not is_timer_running
		
		if is_timer_running:
			timer.start()
		
		else: 
			timer.stop()
		
	if event.is_action_pressed("ui_ammo"):
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
	
	
func change_ammo():
	current_ammo_index = (current_ammo_index + 1) % ammo_types.size()

func _on_timer_timeout() -> void:
	shoot()


					   # shoot using space bar
	
