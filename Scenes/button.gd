extends Button



func _ready() -> void:
	#GameController.change_2d_scene("UTB", true, false, "fade_in", "fade_out", 1.0)	
	pass


func _on_pressed() -> void:
	GlobalAutoload.scene_manager.change_gui_scene("res://Scenes/utb.tscn")
