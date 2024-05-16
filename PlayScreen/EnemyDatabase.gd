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
	"Brawny Ogre": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/Brawny Ogre/BrawnyOgreIdleSide.png"
	},
	"Carrion Crawler": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/Carrion Crawler/CarrionCrawlerIdleSide.png"
	},
	"Clawed Abomination": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/clawed abomination/ClawedAbomination.png"
	},
	"Clawing Harpy": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/Clawing Harpy/ClawingHarpyIdleSide.png"
	},
	"Cloud Giant": {
		"HP": 100,
		"SPEED": 180.0,
		"EXP": 1,
		"Size": 10,
		"Sprite": "res://Interface/Animations/Enemies/Cloud Giant/CloudGiantIdleSide.png"
	}
}

# Function to get enemy data
func getEnemyData(enemy_type: String):
	if enemies.has(enemy_type):
		return enemies[enemy_type]
	else:
		return null

func getAllEnemyNames():
	return enemies.keys()
