class_name Player
extends CharacterBody2D

@onready
var animations = $animations

@onready
var state_machine = $state_machine

func _ready() -> void:
	GlobalAutoload.timer.timeout.connect(_on_timer_timeout)
	state_machine.init(self)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_timer_timeout():
	%YerDeed.visible = true
	get_tree().paused = true	
