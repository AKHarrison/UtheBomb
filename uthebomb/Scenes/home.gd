extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print("bodddyys")
	if body.has_method("despawn"):
		body.despawn()
