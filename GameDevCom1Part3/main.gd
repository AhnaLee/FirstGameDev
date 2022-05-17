extends Node2D

var score = 0 setget set_score
onready var lives = 3 setget set_lives
var pies = 0 setget set_pies

var score2 = 0 setget set_score
onready var lives2 = 3 setget set_lives
var pies2 = 0 setget set_pies

func _ready(): #to hide HUD for defult mode
	score2 = get_node("/root/main/HUD/score").hide()
	lives2 = get_node("/root/main/HUD/lives").hide()
	pies2 = get_node("/root/main/HUD/pies").hide()
	pass
	
func set_score(value):
	score = value
	$HUD/score.set_text("SCORE: "+str(score))
	pass
	
func set_pies(value):
	pies = value
	$HUD/pies.set_text("PIES: "+str(pies))
	pass
	
func set_lives(value):
	lives = value
	$HUD/lives.set_text("LIVES: "+str(lives))
	if lives <= 0:
		get_tree().change_scene("res://EndScene.tscn")
	pass
