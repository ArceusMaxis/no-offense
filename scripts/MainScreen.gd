extends Node2D

func _process(_delta):
	if Input.is_action_pressed("spacebar"):
		get_tree().change_scene("res://scenes/World.tscn")
