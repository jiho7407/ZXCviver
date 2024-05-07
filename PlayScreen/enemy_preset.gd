extends CharacterBody2D

const HP = 100
const SPEED = 180.0
var hp = HP
var damage = 10

func ready():
	pass

func _physics_process(delta):
	velocity = (Player.position - position).normalized() * SPEED
	look_at(Player.position)
	move_and_slide()
	if hp <= 0:
		queue_free()

