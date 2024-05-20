extends CharacterBody2D

var mouse_position : Vector2
var Exp = 0
var Life = 1

func _ready():
	pass

func _process(delta):
	look_at(get_global_mouse_position())

func _physics_process(delta):
	pass


func _on_hitbox_area_entered(area):
	if area.is_in_group("enemies"):
		Life -= 1
		if Life <= 0:
			playerDie()

func playerDie():
	Player.hide()
	get_tree().change_scene_to_file("res://DeathScreen.tscn")
