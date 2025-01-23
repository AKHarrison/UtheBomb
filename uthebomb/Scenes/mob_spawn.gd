extends Node

func spawn_mob(scene_path: String):
	var new_mob = load(scene_path).instantiate()
	%PathFollow2D.progress_ratio  = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
	
	


func _on_timer_timeout() -> void:

	spawn_mob("res://Scenes/flurp.tscn")
