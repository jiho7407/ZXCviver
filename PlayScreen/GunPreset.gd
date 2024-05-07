extends Node2D

var direction = Vector2()
var Bullet = preload("res://PlayScreen/Bullet.tscn")
var shoot_z = 0
var shoot_x = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shoot_z >= 1 and shoot_x >= 1:
		shoot()
		shoot_z = 0
		shoot_x = 0

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("shoot_z"):
			shoot_z += 1
		if Input.is_action_just_pressed("shoot_x"):
			shoot_x += 1

func shoot():
	var bullet = Bullet.instantiate()
	bullet.position = Vector2(0,0)
	bullet.direction = (get_global_mouse_position() - position).normalized()
	self.add_child(bullet)
	
