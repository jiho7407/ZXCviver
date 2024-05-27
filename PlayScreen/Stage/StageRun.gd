extends Node

var EnemyPresetScene = preload("res://PlayScreen/Stage/EnemyPreset.tscn")
const StageEnum = preload("res://PlayScreen/Stage/StageEnum.gd")

var enemy_spawn_wait_time = 1.0
var wave_start_wait_time = 3.0
var process_waiting = false

var on_wave = false
var cur_round = 1
var cur_wave = 1

func _ready():
	print("stage ready")
	$EnemySpawnTimer.wait_time = enemy_spawn_wait_time
	$WaveStartTimer.wait_time = wave_start_wait_time
	run_wave(cur_round, cur_wave)

func _process(delta):
	if process_waiting:
		return
	if on_wave and $Enemies.get_child_count() == 0:
		print("Wave cleared")
		$WaveStartTimer.start()
		process_waiting = true
		await $WaveStartTimer.timeout
		process_waiting = false

		on_wave = false
		cur_wave += 1
		if cur_wave > 3:
			cur_wave = 1
			cur_round += 1
		run_wave(cur_round, cur_wave)

func run_wave(_round: int, _wave: int):
	on_wave = true
	var info = StageEnum.get_wave_info(_round, _wave)
	if not info:
		print("Wave not found")
		return
	var hp = info["hp"]
	var speed = info["speed"]
	var size = info["size"]
	var enemy_count = info["enemy_count"]
	for i in range(enemy_count):
		spawnEnemy(hp, speed, size, 1)
		$EnemySpawnTimer.start()
		await $EnemySpawnTimer.timeout


func spawnEnemy(hp: int, speed: float, size: float, exp: int):
	print("enemy spawned")
	var SpawnMargin = 700
	var PlayerPosition = get_node("../Player").position
	var SpawnPosition = Vector2()
	var EnemyPreset = EnemyPresetScene.instantiate()
	
	
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
	
	var EnemyNamesArray = EnemyEnum.getAllEnemyNames()
	var i = randi_range(0,(len(EnemyNamesArray)-1))
	var EnemyName = EnemyNamesArray[i]
	
	EnemyPreset.init(EnemyName, hp, speed, exp, size)
	EnemyPreset.position = SpawnPosition
	$Enemies.add_child(EnemyPreset)
	if (Player.position-EnemyPreset.position).x > 0:
		EnemyPreset.get_child(1).flip_h = false
	else:
		EnemyPreset.get_child(1).flip_h = true
