extends Line2D

class_name Pencil

var finished = false
var last_pos

func _init():
	antialiased = true

func _physics_process(_delta):
	if not finished:
		if Input.is_action_pressed("draw"):
			var mouse_pos = get_global_mouse_position()
			if last_pos != mouse_pos:
				add_point(mouse_pos)
				last_pos = mouse_pos
		if Input.is_action_just_released("draw"):
			finished = true
