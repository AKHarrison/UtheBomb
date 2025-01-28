extends Node

var timer = Timer.new()
var total_timer = Timer.new()

var scene_manager : SceneManager
var game_controller : GameController

func _ready() -> void:
	add_child(timer)
	add_child(total_timer)
	timer.start(10)
	total_timer.start(40)
	
func _process(delta: float) -> void:
	pass
	
