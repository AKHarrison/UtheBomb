extends Area2D

@onready var label2 = %Label2
@onready var label3 = %Label3

var running = false
var start_time = 0
var dead_bodies = 0
func _ready():
	pass
	
	
func _process(delta: float) -> void:	
	if running:
		# Update timer
		label2.text = "%02d:%02d" % get_time()
		#label3.text = str(dead_bodies)
			

func _physics_process(delta: float) -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_direction != Vector2.ZERO and not running:
		start()
		
func start():
	if not running:  # Only start if not already running
		start_time = Time.get_unix_time_from_system()
		running = true
	
func get_time():
	var time_now = Time.get_unix_time_from_system()
	var elapsed = time_now - start_time
	var seconds = int(elapsed) % 60
	var hours = int(elapsed) / 3600
	var minutes = (elapsed - (3600*hours)) / 60
	return [minutes, seconds] # Return two values

func _on_body_entered(body: Node2D) -> void:
	%YaWun.visible = true
	get_tree().paused = true
	stop()	

func stop():
	running = false
