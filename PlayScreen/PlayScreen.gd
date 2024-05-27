extends Node2D


var EnemyPresetScene = preload("res://PlayScreen/EnemyPreset.tscn")
var GunPresetScene = preload("res://PlayScreen/GunPreset.tscn")
var mouse_position: Vector2

var EnemySpawnTimerWaitTime: float = 0.7

# Called when the node enters the scene tree for the first time.
func _ready():
	Player.Exp = 0
	$CanvasLayer/EXPbar.max_value = 3 #테스트용으로 맞춰둔 맥스 value 이후 난이도 조절 단계에서 조정 필요.
	$EnemySpawnTimer.wait_time = EnemySpawnTimerWaitTime
	$EnemySpawnTimer.start()
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

func spawnEnemy():
	var SpawnMargin = 700
	var PlayerPosition = $Player.position
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
	
	EnemyPreset.init(EnemyName)
	EnemyPreset.position = SpawnPosition
	$Enemies.add_child(EnemyPreset)
	if (Player.position-EnemyPreset.position).x > 0:
		EnemyPreset.get_child(1).flip_h = false
	else:
		EnemyPreset.get_child(1).flip_h = true

func pauseScreen():
	get_tree().paused = !get_tree().paused
	get_viewport().set_input_as_handled()

func shopMode():
	var ItemNames = ItemEnum.getAllItemNames()
	#추후 수정 필요. 상점에 띄울 Item을 랜덤으 고르는 부분로
	randomize()
	ItemNames.shuffle()  # Randomly rearranges the elements of the array
	var ItemKeys =  ItemNames.slice(0, 3)  # Ensures no out-of-range error
	$CanvasLayer/Shop.show()
	if ItemEnum.items.has(ItemKeys[0]):
		$CanvasLayer/Shop/PanelContainer/MarginContainer/VBoxContainer/Name.text = ItemEnum.items[ItemKeys[0]]["Name"]
		$CanvasLayer/Shop/PanelContainer/MarginContainer/VBoxContainer/TextureRect.texture = load(ItemEnum.items[ItemKeys[0]]["Sprite"])
		$CanvasLayer/Shop/PanelContainer/MarginContainer/VBoxContainer/Explanation.text = ItemEnum.items[ItemKeys[0]]["Explanation"]
	else:
		print("Item key not found")
		
	if ItemEnum.items.has(ItemKeys[0]):
		$CanvasLayer/Shop/PanelContainer2/MarginContainer/VBoxContainer/Name.text = ItemEnum.items[ItemKeys[1]]["Name"]
		$CanvasLayer/Shop/PanelContainer2/MarginContainer/VBoxContainer/TextureRect.texture = load(ItemEnum.items[ItemKeys[1]]["Sprite"])
		$CanvasLayer/Shop/PanelContainer2/MarginContainer/VBoxContainer/Explanation.text = ItemEnum.items[ItemKeys[1]]["Explanation"]
	else:
		print("Item key not found")
		
	if ItemEnum.items.has(ItemKeys[0]):
		$CanvasLayer/Shop/PanelContainer3/MarginContainer/VBoxContainer/Name.text = ItemEnum.items[ItemKeys[2]]["Name"]
		$CanvasLayer/Shop/PanelContainer3/MarginContainer/VBoxContainer/TextureRect.texture = load(ItemEnum.items[ItemKeys[2]]["Sprite"])
		$CanvasLayer/Shop/PanelContainer3/MarginContainer/VBoxContainer/Explanation.text = ItemEnum.items[ItemKeys[2]]["Explanation"]
	else:
		print("Item key not found")


func _on_enemy_spawn_timer_timeout():
	spawnEnemy()
	$EnemySpawnTimer.start()


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

