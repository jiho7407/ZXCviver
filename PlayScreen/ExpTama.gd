extends CharacterBody2D

var SPEED = 500
var EXP

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if position.distance_to(get_global_mouse_position()) < 150:
		velocity = (get_global_mouse_position() - position).normalized() * SPEED
		move_and_slide()
		if position.distance_to(get_global_mouse_position()) < 50:
			Player.Exp += EXP
			queue_free()
	else:
		velocity = Vector2(0,0)
