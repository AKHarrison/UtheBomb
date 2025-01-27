extends Node

var timer = Timer.new()

func _ready() -> void:
	add_child(timer)
	timer.start(10)
	
func _process(delta: float) -> void:
	pass
	
