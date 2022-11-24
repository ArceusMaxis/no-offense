extends Node2D


func _ready():
	$AudioStreamPlayer.play()


func _on_Timer_timeout():
	if Input.is_action_pressed("spacebar"):
		get_tree().change_scene("res://scenes/World.tscn")
