extends Area2D

signal coinCollected

func _on_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("coinCollected")
		queue_free()
