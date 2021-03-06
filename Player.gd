extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 9.8
const SPEED = 150
const JUMP_HEIGHT = -300
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else :
		motion.x= 0

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT

	motion = move_and_slide(motion, UP)