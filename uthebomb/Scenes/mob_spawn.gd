extends Node

func spawn_mob_flurp():
	var new_flurp = load("res://Scenes/SmartFlurp.tscn").instantiate()
	new_flurp.global_position = %PokeGym.global_position
	add_child(new_flurp)
	
	
func spawn_mob_Galump():
	var new_galump = load("res://Scenes/SmartGalump.tscn").instantiate()
	new_galump.global_position = %Saloon.global_position
	add_child(new_galump)
	
func spawn_mob_Galump2():
	var new_galump = load("res://Scenes/SmartGalump.tscn").instantiate()
	new_galump.global_position = %Garden.global_position
	add_child(new_galump)
	


func _on_timer_timeout() -> void:
	spawn_mob_flurp()
	spawn_mob_Galump()
	spawn_mob_Galump2()
