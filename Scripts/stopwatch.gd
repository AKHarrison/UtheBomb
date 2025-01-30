extends Control

var running = false
var start_time = 0


func _ready():
	pass
	
func _process(delta):
	if running:
		get_time()

func start():
	running = true
	start_time = Time.get_unix_time_from_system()
	save_time(start_time)
	

func get_time():
	var time_now = Time.get_unix_time_from_system()
	var elapsed = time_now - start_time
	var seconds = elapsed % 60
	var hours = elapsed / 3600
	var minutes = (elapsed - (3600*hours)) / 60
	var elapsed_time = "%02d:%02d" % [minutes, seconds]
	

	
	
func stop():
	running = false

#func _on_Button_pressed():
	#if !running:
		#start()	
	#else:
		#stop()

func save_time(time):
	var config = ConfigFile.new()
	var err = config.load("user://settings.cfg")
	config.set_value("timer", "time", time)
	config.save("user://settings.cfg")
