extends Node

# Dictionary to store enemy data
var items = {
	"ItemPreset": {
		"Name": 100,
		"Sprite": "res://Interface/Animations/Enemies/Acid Ooze/AcidOozeIdleSide.png",
		"Explanation": "Wow very good"
	},
}

# Function to get enemy data
func getItemData(ItemType: String):
	if items.has(ItemType):
		return items[ItemType]
	else:
		return null

func getAllItemNames():
	return items.keys()
