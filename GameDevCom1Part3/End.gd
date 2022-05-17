extends Area2D

export(String, FILE, "*tscn") var next_world

func _on_NextLevel_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(next_world)
		main.pies2 = 0
		main.score2 = 0
		main.lives2 = 3
