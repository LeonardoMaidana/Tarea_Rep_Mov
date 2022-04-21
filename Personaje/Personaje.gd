extends KinematicBody2D
#constantes
const moveSpeed = 95
const maxSpeed = 120

const jumpHeight = -500
const limitJump = -800
const up = Vector2(0,-1)
const gravity = 15

#variables
var motion = Vector2()

func _physics_process(delta):
	
	motion.y +=gravity
	var friction=false
	
	if Input.is_action_just_released("ui_up") or Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		motion.x = 0
		motion.y = 0
		
	if Input.is_action_pressed("ui_right"):

	   motion.x = min(motion.x + moveSpeed, maxSpeed)
	
	elif Input.is_action_pressed("ui_left"):		
		
		 motion.x = max(motion.x - moveSpeed, -maxSpeed)
		
	else:
		friction = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = max(motion.y + jumpHeight, limitJump)

		if friction ==true:
			motion.x = lerp(motion.x,0,0.5)
	else:
		if friction ==true:
			motion.x=lerp(motion.x,0,0.01)
			
	motion = move_and_slide(motion,up)
	
