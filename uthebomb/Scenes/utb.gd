extends Node2D


func _on_timer_timeout():
	%YerDeed.visible = true
	get_tree().paused = true	
