extends Node2D


var EnemyPresetScene = preload("res://PlayScreen/EnemyPreset.tscn")
var GunPresetScene = preload("GunPreset.tscn")
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

func spawnEnemy():
	
	var SpawnMargin = 700
	var PlayerPosition = $Player.position
	var SpawnPosition = Vector2()
	var EnemyPreset = EnemyPresetScene.instantiate()
	
	var enemy = [EnemyPreset]
	
	if randf() < 0.25:  # Spawn either to the left or right
		SpawnPosition.x = PlayerPosition.x - SpawnMargin
		SpawnPosition.y = randf_range(-SpawnMargin, SpawnMargin)
	else: 
		if randf() < 0.5:
			SpawnPosition.x = PlayerPosition.x + SpawnMargin
			SpawnPosition.y = randf_range(-SpawnMargin, SpawnMargin)
		else:
			if randf() < 0.75:
				SpawnPosition.x = randf_range(-SpawnMargin, SpawnMargin)
				SpawnPosition.y = PlayerPosition.y - SpawnMargin
			else:
				SpawnPosition.x = randf_range(-SpawnMargin, SpawnMargin)
				SpawnPosition.y = PlayerPosition.y + SpawnMargin
	
	
	var NewEnemy = enemy[0]
	NewEnemy.position = SpawnPosition
	$Enemies.add_child(NewEnemy)

func pause_screen():
	get_tree().paused = !get_tree().paused
	get_viewport().set_input_as_handled()


func _on_enemy_spawn_timer_timeout():
	spawnEnemy()
	$EnemySpawnTimer.start()


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://TitleScreen/TitleScreen.tscn")
	


func _on_resume_pressed():
	$PauseMenu/CanvasLayer.hide()
	get_tree().paused = false


func _on_options_pressed():
	$PauseMenu/OptionsPopup.show()
