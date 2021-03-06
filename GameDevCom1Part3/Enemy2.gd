extends KinematicBody2D

const GRAVITY = 10
const SPEED = 20
const FLOOR = Vector2(-1, -1)

var velocity = Vector2()

var direction = 1 #direction to the right

var is_dead = false

func dead():
	is_dead = true
	velocity = Vector2(0,0)
	queue_free()


func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * -direction
		
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("fly")
		
		velocity.y = GRAVITY
		velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
		
	if get_slide_count() > 0:
		for i in range (get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.dead()
		
