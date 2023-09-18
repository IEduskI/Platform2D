extends CharacterBody2D

var gravity = 10
var speed = 25
var move = Vector2(0,0)
var moving_left = true

func _ready():
	$AnimationPlayer.play("Walk")
	
func _process(delta):
	_move_character()
	turn()
	
func _move_character():
	velocity.y += gravity
	if moving_left:
		velocity.x = -speed
		move = move_and_slide()
	else:
		velocity.x = speed
		move = move_and_slide()
	

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.receiveDamage(position.x)
		pass

func turn():
	if not $RayCast2D.is_colliding():
		moving_left = !moving_left
		scale.x = -scale.x
