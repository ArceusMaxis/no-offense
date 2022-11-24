extends CPUParticles2D

func _on_timeout():
	queue_free()
