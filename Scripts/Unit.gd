extends KinematicBody2D

#Physics Variables
var target = Vector2.ZERO
var velocity = Vector2.ZERO
var speed = 30
var speed_x = 0
var speed_y = 0
var input_direction = 0
var direction = 0
#Physcs Constants
const MAX_SPEED = 80
const ACCELERATION = 10
const DECELERATION = 20
const JUMP_FORCE = 80
const GRAVITY = 20
#Moving Variables
var dragging = false #Are we currently dragging?
var selected = [] #Array of currently selected units.
#selected[], not needed unless horde range attack is implemented 
var drag_start = Vector2.ZERO #Location where drag began.
var select_rectagle = RectangleShape2D.new() #collision shape for drag box.
#selected_rectangle, not needed at all
var mouse_left_down
var halt = false # make halt function


func Stop(halt):
		if halt == true:
			dragging = false
		elif halt == false:
			dragging = true

func Jump():
	pass

func _ready():
	target = position

func _physics_process(delta):
	velocity = Vector2.ZERO
	#if position.distance_to(target) > tgt_max:
		#velocity = position.direction_to(target) * speed

func move_to(tgt):
	target = tgt
	

func select():
	selected = true
	$Selected.visible = true

func deselected():
	selected = false
	$Selected.visible = false


