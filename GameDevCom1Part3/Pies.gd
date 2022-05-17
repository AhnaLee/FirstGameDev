extends "res://main.gd"



func _on_Pies_body_entered(body):
	if body.name == "Player":
		get_node("/root/main").pies += 1
		queue_free()
	pass # Replace with function body.
