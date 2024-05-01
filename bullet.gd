extends Area2D

var direction: Vector2
var speed: float = 200

func _process(delta):
	position += direction * speed * delta
