extends Node2D

# Getting the speed varibale valued
const SPEED = 60

# Variable of the name root "Direction" is 1
var direction = 1

# Directionary inputs 
@onready var  ray_cast_right = $RayCastRight
@onready var  ray_cast_left = $RayCastLeft
@onready var  ray_cast_down_right = $RayCastDownRight
@onready var  ray_cast_down_left = $RayCastDownLeft
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check for walls (horizontal collision)
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	# Check for platform edges (no ground below)
	if direction == 1 and not ray_cast_down_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if direction == -1 and not ray_cast_down_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta
