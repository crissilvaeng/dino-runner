extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.y = -player.jump_impulse
	player.animation.play(JUMPING)
	player.sound.play()

func physics_update(delta: float) -> void:
	player.velocity.x = player.speed
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	if player.velocity.y >= 0:
		finished.emit(RUNNING)
