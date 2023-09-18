extends CharacterBody2D

const moveSpeed = 40
const maxSpeed = 70
const jumpHeight = - 300
const up = Vector2(0,-1)
const gravity = 15
var canvasLayer

@onready var sprite = $Sprite2D
@onready var animationPlayer=$AnimationPlayer
var motion = Vector2()
var lifes = 3

func _ready():
	canvasLayer = get_tree().get_first_node_in_group("Canvas")

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


func receiveDamage(enemyPosX):
	if position.x < enemyPosX:
		velocity.x = -400
		velocity.y = -200
		
	if position.x > enemyPosX:
		velocity.x = 400
		velocity.y = 200
		
	lifes -= 1
	print("lose 1 life, left: "+str(lifes))
	## Call to func hearts in canvas
	canvasLayer.handleHearts(lifes)
	if lifes <= 0:
		get_tree().reload_current_scene()
