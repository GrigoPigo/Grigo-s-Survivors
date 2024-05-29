extends CharacterBody2D

signal healt_depleted

var health = 100

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 550
	move_and_slide()

	const DAMAGE_RATE = 20.0
	var overlapping_mobs = %hitbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		%ProgressBar.max_value = 500 
		if health <= 0:
			healt_depleted.emit()
	
