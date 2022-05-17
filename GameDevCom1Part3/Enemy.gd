extends "res://main.gd"


func _on_Enemy_body_entered(body):
	if body.name == "Player":
		get_node("/root/main").lives -= 1
		get_node("/root/main").score -= 5
		queue_free()


func _on_Enemy_area_entered(area):
	if area.is_in_group("Fireball"):
		queue_free()
