extends Node

# Dictionary to store enemy data
var enemies = {
	"Acid Ooze": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/Acid Ooze/AcidOozeIdleSide.png"
	},
	"Adept Necromancer": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/adept necromancer/AdeptNecromancer.png"
	},
	"Antlered Rascal": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 15,
		"Sprite": "res://Interface/Animations/Enemies/antlered rascal/AntleredRascal.png"
	},
	"Astral Dreadnought": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/Astral Dreadnought/AstralDreadnoughtIdleSide.png"
	},
	"Barbed Manticore": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/Barbed Manticore/BarbedManticoreIdleSide.png"
	},
	"Beryl Doppleganger": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/Beryl Doppleganger/BerylDopplegangerIdleSide.png"
	},
	"Blinded Grimlock": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/Blinded Grimlock/BlindedGrimlockIdleSide.png"
	},
	"Bloodshot Eye": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/Bloodshot Eye/BloodshotEyeIdleSide.png"
	},
	"Brawny Ogre": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/Brawny Ogre/BrawnyOgreIdleSide.png"
	},
}

# Function to get enemy data
func getEnemyData(enemy_type: String):
	if enemies.has(enemy_type):
		return enemies[enemy_type]
	else:
		return null

func getAllEnemyNames():
	return enemies.keys()
