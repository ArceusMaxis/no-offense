extends KinematicBody2D

var speed = rand_range(500,900)
var velocity = Vector2.ZERO
onready var target = get_node("../Player")
var deadfx = preload("res://scenes/Deathfx.tscn")
signal dead

func _physics_process(delta):
	velocity = Vector2.ZERO
	look_at(target.position)
	velocity = position.direction_to(target.position) * speed
	velocity = move_and_slide(velocity)

func _on_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("shield"):
		emit_signal("dead")
		queue_free()
		$enemydie.play()
		var dinst = deadfx.instance()
		get_parent().add_child(dinst)
		dinst.global_position = global_position
		dinst.global_rotation = rotation - 90
		
	if area.is_in_group("player"):
		get_tree().change_scene("res://scenes/Rip.tscn")
