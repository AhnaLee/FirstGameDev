extends Node2D

var main = preload("res://main.tscn")

func _ready():
	get_node("/root/main/HUD/score").show()
	get_node("/root/main/HUD/lives").show()
	get_node("/root/main/HUD/pies").show()
	pass # Replace with function body.


