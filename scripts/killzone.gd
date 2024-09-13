extends Area2D

func _on_body_entered(body):
	$DeathSFX.play()
	print("Killzone trigger")
	if body is Player:
		body.do_death()