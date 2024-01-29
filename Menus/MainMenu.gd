extends Control

@onready var play = $Play
@onready var options = $Options
@export var levelSelect : PackedScene
@export var optionsMenu : PackedScene
var save_path = "user://levels.save"

# Called when the node enters the scene tree for the first time.
func _ready():
	if !FileAccess.file_exists(save_path):
		print("Save File Created")
		var file = FileAccess.open(save_path, FileAccess.WRITE)
		file.store_8(0)
		file.close()
	else:
		var file = FileAccess.open(save_path, FileAccess.READ)
		print(file.get_8())
		file.close()
func _on_play_pressed():
	get_tree().change_scene_to_packed(levelSelect)
