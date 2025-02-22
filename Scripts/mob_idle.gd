extends CharacterBody2D



func _process(delta: float) -> void:
	idle()
	
func idle():
	%AnimationPlayer.play("idle")
