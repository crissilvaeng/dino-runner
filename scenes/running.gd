extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.animation.play(RUNNING)

func physics_update(delta: float) -> void:
	player.velocity.x = player.speed
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if Input.is_action_just_pressed("move_up"):
		finished.emit(JUMPING)
	elif Input.is_action_just_pressed("move_down"):
		finished.emit(DUCKING)
