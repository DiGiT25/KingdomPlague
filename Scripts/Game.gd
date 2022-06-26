extends Node2D

var dragging = false #Are we currently dragging?
var selected = [] #Array of currently selected units.
#selected[], not needed unless horde range attack is implemented 
var drag_start = Vector2.ZERO #Location where drag began.
var select_rectagle = RectangleShape2D.new() #collision shape for drag box.
#selected_rectangle, not needed at all
var mouse_left_down
var halt = false # make halt function
var speed_x = 0
var speed_y = 0
var velocity = Vector2()
var input_direction = 0
var direction = 0

const MAX_SPEED = 80
const ACCELERATION = 10
const DECELERATION = 20

const JUMP_FORCE = 80
const GRAVITY = 20



onready var select_draw = $SelectDraw

func Stop(halt):
		if halt == true:
			dragging = false
		elif halt == false:
			dragging = true

func Jump():
	pass

func _unhandled_input(event):
	#Moving with mouse move
	if event is InputEventMouseMotion:
		dragging = true
		drag_start = event.position
	#incomplete
	
	#Jumping with M1 
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			mouse_left_down = true
			###add jump(mouse_left_down) add me
		elif event.button_index == 1 and not event.is_pressed():
			mouse_left_down = false
	
	#Standing still
	if event is Input.si_key_pressed("Halt"):
		if halt == false:
			Stop(halt)
		elif halt == true:
			Stop(halt)
	
			
	#Sending one or multiple rats forward to attack
	
	#Additional functions
	
	
	
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			for unit in selected:
				unit.collider.deselected()
			selected = []
			dragging = true
			drag_start = event.position
		#Button released while dragging
		elif dragging:
			dragging = false
			select_draw.update_status(drag_start, event.position, dragging)
			var drag_end = event.position
			select_rectagle.extents = (drag_end - drag_start) / 2
			var space = get_world_2d().direct_space_state
			var query = Physics2DShapeQueryParameters.new()
			query.set_shape(select_rectagle)
			query.transform = Transform2D(0, (drag_end + drag_start) / 2)
			#Result in an array of dictionaries. Each has a "collider" key.
			selected = space.intersect_shape(query)
			for unit in selected:
				unit.collider.select()
				
	if dragging:
		if event is InputEventMouseMotion:
			select_draw.update_status(drag_start, event.position, dragging)
	if event is InputEventMouseButton and event.button_index == BUTTON_MASK_RIGHT:
		for selection in selected:
			print(event.button_index)
			selection.collider.move_to(event.position)
			

	
		
