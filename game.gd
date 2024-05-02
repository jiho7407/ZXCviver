extends Node2D

var spawn_margin = 1200
var EnemyPresetScene = preload("res://enemy_preset.tscn")
var paused:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$EnemySpawnTimer.wait_time = 0.5
	$EnemySpawnTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_cancel") and paused == false:
		$CanvasLayer.show()
		get_tree().paused = true

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
	
	self.add_child(new_enemy)


func _on_enemy_spawn_timer_timeout():
	spawn_enemy()
	$EnemySpawnTimer.start()


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://main_screen.tscn")
