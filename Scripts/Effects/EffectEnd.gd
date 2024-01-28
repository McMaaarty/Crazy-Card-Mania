extends Node2D

func start_emitting():
	$CPUParticles2D.emitting = true;
	$Timer.start()
	
func start_emitting_alternatif():
	$CPUParticles2D2.emitting = true;
	$Timer.start()

func _on_timer_timeout():
	self.queue_free()
