extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var story_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_screen_size()
	
	OS.set_window_position(screen_size*0.5 - window_size*0.5)
	
	pass # Replace with function body.

#func _process(delta):
#	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

 
func _on_StoryButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://Story.tscn")
	pass # Replace with function body.


func _on_PlayButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://World1.tscn")
	pass # Replace with function body.


func _on_HowToButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://HowToPlay.tscn")
	pass # Replace with function body.


func _on_ExitButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://EndScene.tscn")
	pass # Replace with function body.
