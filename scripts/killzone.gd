extends Area2D

@onready var timer = $Timer
var you_died
var score_label

func _on_body_entered(body):
	print("You died!")
	Engine.time_scale = 0.3
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	var direction = "yes"
	you_died = body.get_node("YouDied")
	score_label = body.get_node("ScoreLabel")
	you_died.text = "You Died"
	score_label.text = ""
	$DeathSFX.play()
	

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
