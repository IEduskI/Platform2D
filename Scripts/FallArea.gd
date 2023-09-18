extends Area2D

func _on_body_entered(body):
	print(body.get_name())
	if body.is_in_group("Player"):
		print("i fall")
		get_tree().reload_current_scene()
