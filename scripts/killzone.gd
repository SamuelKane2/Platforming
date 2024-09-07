extends Area2D

@onready var timer = $Timer
var score_label
@onready var death_screen: Control = %DeathScreen

func _on_body_entered(body):
	print("You died!")
	Engine.time_scale = 0.3
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	#score_label = body.get_node("ScoreLabel")
	#score_label.text = ""
	death_screen = get_node("DeathScreen")
	$DeathSFX.play()
	death_screen.visible = true

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
