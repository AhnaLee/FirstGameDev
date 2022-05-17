extends KinematicBody2D

export var move_speed = 2.0
export var move_distance = 70
export var move_direction = Vector2(1,1)
var time_since_init = 0.0
var origin = Vector2(0,0)


func _ready():
	time_since_init = 0.0
	origin = position #equal to current position of platform



func _physics_process(delta):
	time_since_init = time_since_init + delta
	var position_on_curve = sin(move_speed * PI * time_since_init)
	var offset = move_distance * position_on_curve * move_direction
	position = origin + offset
