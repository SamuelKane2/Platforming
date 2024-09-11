extends Area2D

func _on_body_entered(body):
	print("Winzone trigger")
	if body is Player:
		body.do_end()
		
