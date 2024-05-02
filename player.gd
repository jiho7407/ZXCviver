extends CharacterBody2D

var mouse_position : Vector2
var hp = 100

func _ready():
	pass

func _process(delta):
	look_at(get_global_mouse_position())

func _physics_process(delta):
	pass


