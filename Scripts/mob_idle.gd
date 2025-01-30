extends CharacterBody2D

@onready var old_man1 = preload("res://Scenes/mob_old_man1.tscn")

func _process(delta: float) -> void:
	idle()
	
func idle():
	%AnimationPlayer.play("idle")

func flurp_again():
	queue_free()
	var returning_flurp = old_man1.instantiate()
	returning_flurp.global_position = global_position
	get_tree().get_root().add_child(returning_flurp)
	
	

func change_state_twat():
		pass

func change_state_divvy():
		flurp_again()

func change_state_numpty():
		pass


 
