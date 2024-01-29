extends Control



@onready var cardContainer = $ScrollContainer/HBoxContainer

var save_path = "user://levels.save"
# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		var unlockedNumber = file.get_8()
		file.close()
		for a in cardContainer.get_children():
			a.checkIfUnlocked(unlockedNumber)
