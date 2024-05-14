extends Node

# Dictionary to store enemy data
var enemies = {
	"Acid Ooze": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 8,
		"Sprite": "res://Interface/Animations/Enemies/Acid Ooze/AcidOozeIdleSide.png"
	},
	"Adept Necromancer": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 8,
		"Sprite": "res://Interface/Animations/Enemies/adept necromancer/AdeptNecromancer.png"
	}
}

# Function to get enemy data
func get_enemy_data(enemy_type: String):
	if enemies.has(enemy_type):
		return enemies[enemy_type]
	else:
		return null
