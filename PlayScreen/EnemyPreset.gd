extends CharacterBody2D

const SPEED = 180.0
var hp = 100
var damage = 10

func ready():
	pass

func _physics_process(delta):
	velocity = (Player.position - position).normalized() * SPEED
	move_and_slide()
	if hp <= 0:
		queue_free()

