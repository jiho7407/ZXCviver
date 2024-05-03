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


func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet"):
		hp -= 50
	if area.is_in_group("PlayerHitbox"):
		Player.hp -= damage
		queue_free()
