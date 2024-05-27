extends Node

# Dictionary to store enemy data
var items = {
	"ItemPreset": {
		"Name" : "Itempreset",
		"Explanation": "Wow very good",
		"Sprite": "res://PlayScreen/ItemEnum.tscn::AtlasTexture_ltgn2"
	},
	"DamageUp": {
		"Name" : "Heavy knife",
		"Explanation": "Increase Egg Damage +1",
		"Sprite": "res://PlayScreen/ItemEnum.tscn::AtlasTexture_ltgn2"
	},
	"asdf": {
		"Name" : "Heavy knife",
		"Explanation": "Increase Egg Damage +1",
		"Sprite": "res://PlayScreen/ItemEnum.tscn::AtlasTexture_ltgn2"
	},
}

# Function to get enemy data


func getAllItemNames():
	return items.keys()
