extends CharacterBody2D

var mouse_position : Vector2

func _ready():
	pass

func _process(delta):
	look_at(get_global_mouse_position())

func _physics_process(delta):
	pass


func _on_hitbox_area_entered(area):
	if area.is_in_group("enemies"):
		get_tree().change_scene_to_file("res://DeathScreen.tscn")
