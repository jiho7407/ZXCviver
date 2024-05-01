extends Node2D

var spawn_margin = 1200
var EnemyPresetScene = preload("res://enemy_preset.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawn_enemy() # 여기에 있는 이 함수 때문에 지금은 매 프레임마다 enemy 스폰 됨. 나중에 당연히 수정 필요.

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
