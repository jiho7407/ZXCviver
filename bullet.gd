extends Area2D

var direction: Vector2
var speed: float = 400

func _process(delta):
	position += direction * speed * delta
	look_at(direction)
