extends CharacterBody2D

class_name Player

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Double Jump Variables
var jump_count = 0
var max_jumps = 2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# If on floor reset jump count
	if is_on_floor():
		jump_count = 0

	# Double jump.
	if Input.is_action_just_pressed("jump") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
	
	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")

	#Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
			animated_sprite.flip_h = true

	# Play animation
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

var score = 0

@onready var score_label = %ScoreLabel

func add_point():
	score += 1
	score_label.text = "Coins: " + str(score)

# Death screen
@onready var timer = %Timer
@onready var death_screen = %DeathScreen
@onready var end_screen = %WinScreen

func do_death():
	self.get_node("CollisionShape2D").queue_free()
	timer.start()
	death_screen.visible = true
	get_tree().paused = true

func _on_timer_timeout():
	get_tree().paused = false
	get_tree().reload_current_scene()


@onready var win_shape: CollisionShape2D = %WinShape

func do_end():
	print("sdfsdf")
	win_shape.queue_free()
	timer.start()
	end_screen.visible = true
	get_tree().paused = true

