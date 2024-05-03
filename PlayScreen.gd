extends Node2D

var spawn_margin = 700
var EnemyPresetScene = preload("res://enemy_preset.tscn")
var GunPresetScene = preload("gun_preset.tscn")
var mouse_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	$EnemySpawnTimer.wait_time = 0.7
	$EnemySpawnTimer.start()
	var GunPreset = GunPresetScene.instantiate()
	$Weapons.add_child(GunPreset)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("ui_cancel"):
			if get_tree().paused == false:
				$PauseMenu/CanvasLayer.show()
			else:
				$PauseMenu/CanvasLayer.hide()
			pause_screen()

func spawn_enemy():

	# Randomly position the enemy first before adding to the scene
	var player_position = $Player.position
	var spawn_position = Vector2()
	var EnemyPreset = EnemyPresetScene.instantiate()
	
	var enemy = [EnemyPreset]
	
	if randf() < 0.25:  # Spawn either to the left or right
		spawn_position.x = player_position.x - spawn_margin
		spawn_position.y = randf_range(-spawn_margin, spawn_margin)
	else: 
		if randf() < 0.5:
			spawn_position.x = player_position.x + spawn_margin
			spawn_position.y = randf_range(-spawn_margin, spawn_margin)
		else:
			if randf() < 0.75:
				spawn_position.x = randf_range(-spawn_margin, spawn_margin)
				spawn_position.y = player_position.y - spawn_margin
			else:
				spawn_position.x = randf_range(-spawn_margin, spawn_margin)
				spawn_position.y = player_position.y + spawn_margin
	
	
	var new_enemy = enemy[0]
	new_enemy.position = spawn_position
	
	$Enemies.add_child(new_enemy)

func pause_screen():
	get_tree().paused = !get_tree().paused
	get_viewport().set_input_as_handled()


func _on_enemy_spawn_timer_timeout():
	spawn_enemy()
	$EnemySpawnTimer.start()


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://title_screen.tscn")
	


func _on_resume_pressed():
	$PauseMenu/CanvasLayer.hide()
	get_tree().paused = false


func _on_options_pressed():
	$PauseMenu/OptionsPopup.show()
