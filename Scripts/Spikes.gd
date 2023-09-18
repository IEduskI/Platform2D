extends Area2D

signal spikeDamage

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.receiveDamage(position.x)
