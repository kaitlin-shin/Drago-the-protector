extends KinematicBody2D

export (int) var speed = 1
var velocity = Vector2()
var prevdir = "dstand"

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
		# Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if velocity.x == 0 and velocity.y == 0:
		$AnimatedSprite.animation = String(prevdir)
	elif abs(velocity.x)>=abs(velocity.y):
		if velocity.x>0:
			$AnimatedSprite.animation = "rwalk"
			prevdir = "rstand"
		else:
			$AnimatedSprite.animation = "lwalk"
			prevdir = "lstand"
	elif abs(velocity.x)<abs(velocity.y):
		if velocity.y>0:
			$AnimatedSprite.animation = "dwalk"
			prevdir = "dstand"
		else:
			$AnimatedSprite.animation = "uwalk"
			prevdir = "ustand"

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
