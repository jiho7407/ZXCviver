extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_exit_pressed():
	await get_tree().create_timer(0.05).timeout
	get_tree().quit()




