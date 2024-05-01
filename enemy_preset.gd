extends CharacterBody2D

const HP = 100
const SPEED = 200.0
var hp = HP

func ready():
	pass

func _physics_process(delta):
	velocity = (Player.position - position).normalized() * SPEED
	move_and_slide()
	if hp <= 0:
		queue_free()


func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet") == true:
		hp -= 50
