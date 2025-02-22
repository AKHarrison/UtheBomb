extends Node

var mob_types = [
	preload("res://Scenes/mob_green.tscn"),
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
	
func spawn_mob_shops():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %shops.global_position
	add_child(new_mob)
	
func spawn_mob_roughterr():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %roughterr.global_position
	add_child(new_mob)

func spawn_mob_park():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %park.global_position
	add_child(new_mob)
	
func spawn_mob_nice_ter():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %niceterrace.global_position
	add_child(new_mob)
	
func spawn_mob_dreggs():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %dreggs.global_position
	add_child(new_mob)
	
func spawn_mob_blockbust():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %blockbust.global_position
	add_child(new_mob)
	
func _on_timer_timeout() -> void:
	spawn_mob_saloon()
	spawn_mob_pokegym()
	spawn_mob_blockbust()
	spawn_mob_dreggs()
	spawn_mob_nice_ter()
	spawn_mob_roughterr()
	spawn_mob_shops()
	spawn_mob_park()
	


func _on_timer_2_timeout() -> void:
	spawn_mob_garden()
