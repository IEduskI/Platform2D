extends CharacterBody2D

const moveSpeed = 40
const maxSpeed = 70
const jumpHeight = - 300
const up= Vector2(0,-1)
const gravity= 15

@onready var sprite = $Sprite2D
@onready var animationPlayer=$AnimationPlayer
var motion = Vector2()

func _physics_process(delta):
	velocity.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h= true
		animationPlayer.play("Walk")
		velocity.x = min(velocity.x+moveSpeed,maxSpeed)
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h= false
		animationPlayer.play("Walk")
		velocity.x = max(velocity.x-moveSpeed,-maxSpeed)
	else:
		animationPlayer.play("Idle")
		friction=true
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			velocity.y = jumpHeight
		if friction == true:
			velocity.x = lerp(0,0, 0)
	else:
		if friction == true:
			velocity.x = lerp(0,0,1)
	motion = move_and_slide()
