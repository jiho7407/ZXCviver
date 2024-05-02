extends CanvasLayer

var paused:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event) -> void:
	if (Input.is_action_just_pressed("ui_cancel")):
		pause_resume()

func pause_resume():
	if paused == false:
		$MarginContainer.show()
		paused = true
		get_tree().paused = true
		get_viewport().set_input_as_handled()
	else:
		$MarginContainer.hide()
		paused = false
		get_tree().paused = false
		get_viewport().set_input_as_handled()


func _on_resume_pressed():
	pause_resume()


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://main_screen.tscn")
