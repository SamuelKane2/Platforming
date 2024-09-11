extends Area2D

func _on_body_entered(body):
	$DeathSFX.play()
	if body is Player:
		body.do_death()