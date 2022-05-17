extends Node2D

var destination 

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		destination = get_node("PortalDestination").get_global_position()
		$AnimatedSprite.play("portal")
		body.set_position(destination)

