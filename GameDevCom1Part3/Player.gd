extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
# const ACCELERATION = 50 
const MAX_SPEED = 500
const JUMP_HEIGHT = -550
const FIREBALL = preload("res://Fireball.tscn") #11:10 part5


var velocity = Vector2()

var is_attacking = false #part7 1:50
var is_dead = false
var on_ground = false


func _physics_process(delta):
	
	velocity = move_and_slide(velocity, UP)
	velocity.y += GRAVITY	

	if Input.is_action_pressed("ui_right"):
		if is_attacking == false:
			velocity.x = MAX_SPEED
			$AnimatedSprite.play("Run")
			$AnimatedSprite.flip_h = false
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
			
	elif Input.is_action_pressed("ui_left"):
		if is_attacking == false:
			velocity.x = -MAX_SPEED
			$AnimatedSprite.play("Run")
			$AnimatedSprite.flip_h = true
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
	else:
		velocity.x = 0
		if is_attacking == false:
			$AnimatedSprite.play("Idle")
	
	if Input.is_action_just_pressed("ui_up"):
		if is_attacking == false:
			if on_ground:
				velocity.y = JUMP_HEIGHT
				on_ground = false
				$AnimatedSprite.play("Jump")
				$soundJump.play()	
				
	if is_on_floor():
		on_ground = true
	else:
		if is_attacking == false:
			on_ground = false
			if velocity.y < 0:
				$AnimatedSprite.play("Jump")
			else:
				$AnimatedSprite.play("Fall")
					
	if Input.is_action_just_pressed("ui_focus_next") && is_attacking == false:
		is_attacking = true
		$AnimatedSprite.play("attack")
		$soundShoot.play()
		var fireball = FIREBALL.instance()
		#direction of the fireball
		if sign($Position2D.position.x) == 1:
			fireball.set_fireball_direction(1)
		else:
			fireball.set_fireball_direction(-1)
			
		get_parent().add_child(fireball)
		fireball.position = $Position2D.global_position #fireball position to right spot
		

	

func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://World1.tscn")
	if body.name == "Player":
		get_node("/root/main").lives -= 1


func _on_fallzone2_body_entered(body):
	get_tree().change_scene("res://World2.tscn")
	if body.name == "Player":
		get_node("/root/main").lives -= 1

	get_tree().change_scene("res://World2.tscn")

func dead():
	is_dead = true
	main.lives = 3
	main.score = 0
	main.pies = 0
	#motion = Vector2(0,0)
	#$AnimatedSprite.play("dead")
	get_tree().change_scene("res://EndScene.tscn")
	#$CollisionShape2D.disabled = true
	#$Timer.start()
	

func _on_Sprite_animation_finished():
	is_attacking = false



