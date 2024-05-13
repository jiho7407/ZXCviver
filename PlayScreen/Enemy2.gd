extends CharacterBody2D

const SPEED = 180.0
var hp = 100
var damage = 10
var EXP = 1

func ready():
	pass

func _physics_process(delta):
	velocity = (Player.position - position).normalized() * SPEED
	move_and_slide()
	if hp <= 0:
		Player.Exp += EXP
		queue_free()

