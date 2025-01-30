extends Area2D

var enemies_in_range: Array = [] 

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() > 0:
		print(enemies_in_range.size())

func dead_bodies():
	var dead_bodies = enemies_in_range.size()
