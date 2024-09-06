extends Area2D

@onready var timer = $Timer
@onready var you_died = $"../Player/YouDied"
@onready var score_label = %ScoreLabel

func _on_body_entered(body):
	print("You died!")
	Engine.time_scale = 0.2
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	you_died.text = "You Died"
	score_label.text = ""

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
