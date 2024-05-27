extends Node2D


var GunPresetScene = preload("res://PlayScreen/GunPreset.tscn")
var StageScene = preload("res://PlayScreen/Stage/StageScene.tscn")
var mouse_position: Vector2

var EnemySpawnTimerWaitTime: float = 0.7

# Called when the node enters the scene tree for the first time.
func _ready():
	Player.Exp = 0
	$CanvasLayer/EXPbar.max_value = 3 #테스트용으로 맞춰둔 맥스 value 이후 난이도 조절 단계에서 조정 필요.
	var GunPreset = GunPresetScene.instantiate()
	$Weapons.add_child(GunPreset)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/EXPbar.value = Player.Exp
	if $CanvasLayer/EXPbar.value >= $CanvasLayer/EXPbar.max_value:
		$CanvasLayer/EXPbar.value = 0
		Player.Exp = 0
		pauseScreen()
		shopMode()

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("ui_cancel"):
			if get_tree().paused == false:
				$PauseMenu/CanvasLayer.show()
			else:
				$PauseMenu/CanvasLayer.hide()
			pauseScreen()

func pauseScreen():
	get_tree().paused = !get_tree().paused
	get_viewport().set_input_as_handled()

func shopMode():
	$CanvasLayer/Shop.show()


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://TitleScreen/TitleScreen.tscn")
	


func _on_resume_pressed():
	$PauseMenu/CanvasLayer.hide()
	get_tree().paused = false


func _on_options_pressed():
	$OptionsWindow.show()

func _on_options_popup_close_requested():
	$OptionsWindow.hide()


func _on_select_button_1_pressed():
	$CanvasLayer/Shop.hide()
	pauseScreen()


func _on_select_button_2_pressed():
	$CanvasLayer/Shop.hide()
	pauseScreen()


func _on_select_button_3_pressed():
	$CanvasLayer/Shop.hide()
	pauseScreen()

