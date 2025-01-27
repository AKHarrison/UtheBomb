extends Node

@onready var label = $Label

func _ready():
	GlobalAutoload.timer.timeout.connect(time_left_to_live)
	
func time_left_to_live():
	var time_left = GlobalAutoload.timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]
	
func _process(delta: float) -> void:
	label.text = "%02d:%02d" % time_left_to_live()
