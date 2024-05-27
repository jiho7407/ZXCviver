extends Area2D

var direction: Vector2
var speed: float = 400
var damage: int
var penetration: int

func _process(delta):
	position += direction * speed * delta
	look_at(direction)


func _on_area_entered(area):
	if area.is_in_group("enemies"):
		area.owner.hp -= self.damage
		self.penetration -= 1
		if self.penetration <= 0:
			queue_free()
