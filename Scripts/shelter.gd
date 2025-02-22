extends Area2D
@onready var label2 = %Label2
func _ready():
	GlobalAutoload.timer.timeout.connect(_on_body_entered)
	#GlobalAutoload.total_timer.timeout.connect(time_alive)
	
#func time_alive():
	#var time_left = GlobalAutoload.total_timer.time_left
	#var minute = floor(time_left / 60)
	#var second = int(time_left) % 60
	#return [minute, second]
	#
#func _process(delta: float) -> void:
	#label2.text = "%02d:%02d" % time_alive()

func _on_body_entered(body: Node2D) -> void:
	%YaWun.visible = true
	get_tree().paused = true	
	
