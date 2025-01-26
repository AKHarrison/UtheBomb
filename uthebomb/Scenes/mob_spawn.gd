extends Node

var mob_types = [
	preload("res://Scenes/SmartFlurp.tscn"),
	preload("res://Scenes/SmartFlurp2.tscn"),
	preload("res://Scenes/SmartGalump.tscn"),
	preload("res://Scenes/SmartGalump2.tscn")
] 


func spawn_mob_saloon():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %Saloon.global_position
	add_child(new_mob)

func spawn_mob_pokegym():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %PokeGym.global_position
	add_child(new_mob)
	
func spawn_mob_garden():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %Garden.global_position
	add_child(new_mob)

func _on_timer_timeout() -> void:
	spawn_mob_saloon()
	spawn_mob_pokegym()
	spawn_mob_garden()
