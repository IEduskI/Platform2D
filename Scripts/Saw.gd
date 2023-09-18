extends Node2D

func _ready():
	$AnimationPlayer.play("RotateSaw")
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.receiveDamage(position.x)
		pass
