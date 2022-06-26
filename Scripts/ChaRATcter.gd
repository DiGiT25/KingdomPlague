extends KinematicBody2D

var min_move_speed = 50
var max_move_speed = 250
var stop_distance = 20
var mouse = get_global_mouse_position()

func _process(delta):
	_look_at_mouse()
	_move_to_mouse()

func _look_at_mouse():
	look_at(get_global_mouse_position())

func _move_to_mouse():
	var direction = mouse - position
	if event is InputEventMouseMotion:
		if event.position.x <= 32 and position.y <= 18:
			$Sprite.rotation_degrees = 45
			$Sprite.flip_h = true
			#looking top left corner
		if position.x >= 32 and position.y <= 18:
			rotation_degrees = -45
			$Sprite.flip_h = false
			#looking top right corner
		if position.x <= 32 and position.y >= 18:
			rotation_degrees = -45
			$Sprite.flip_h = true
			#looking bottom left corner
		if position.x >= 32 and position.y >= 18:
			rotation_degrees = 45
			$Sprite.flip_h = false
			#looking bottom left corner
	
	
	var normalized_direction = direction.normalized()
	var direction_distance = direction.length()
	move_and_slide(normalized_direction * max(min_move_speed, min(max_move_speed, direction_distance)))
	
