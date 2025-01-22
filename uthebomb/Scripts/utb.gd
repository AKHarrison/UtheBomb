extends Node2D

var global_timer

func _ready():
	global_timer = $Timer

func _on_timer_timeout():
	get_tree().paused = true	
