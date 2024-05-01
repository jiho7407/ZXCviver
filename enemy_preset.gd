extends CharacterBody2D

const SPEED = 200.0

func _physics_process(delta):
	velocity = (Player.position - position).normalized() * SPEED
	move_and_slide()
