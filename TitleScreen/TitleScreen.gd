extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://PlayScreen/play_screen.tscn")


func _on_options_pressed():
	$CanvasLayer/OptionsWindow.show()


func _on_options_window_close_requested():
	$CanvasLayer/OptionsWindow.hide()



func _on_exit_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()








func _on_check_button_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if toggled_on == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

