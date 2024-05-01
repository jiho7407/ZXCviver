extends Node2D

var direction = Vector2()
var Bullet = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("shoot_z") or Input.is_action_just_pressed("shoot_x"):
		shoot()

func shoot():
	var bullet = Bullet.instantiate()
	bullet.position = Vector2(0,0)
	bullet.direction = (get_global_mouse_position() - position).normalized()
	add_child(bullet)
	
