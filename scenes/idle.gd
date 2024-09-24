extends PlayerState

@export var animation: AnimatedSprite2D

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.x = 0.0
	player.animation.play(IDLE)


func physics_update(_delta: float) -> void:
	player.velocity.y += player.gravity * _delta
	player.move_and_slide()

	if Input.is_action_just_pressed("move_up"):
		finished.emit(JUMPING)
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		finished.emit(RUNNING)
	elif Input.is_action_just_pressed("move_down"):
		finished.emit(DUCKING)
