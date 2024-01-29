extends Node2D

@onready var game_over_menu = $UI/GameOverMenu
@onready var button = $UI/VBoxContainer/Button
@onready var button_2 = $UI/VBoxContainer/Button2
var save_path = "user://levels.save"
@onready var dialogue = $UI/DialogueHBox
@onready var ai_paddle = $AIPaddle

var dialogueTree = {"ready":[], "aiWin":[], "playerWin":[]}
var textureTree = {"ready":[], "aiWin":[], "playerWin":[]}
var numberToCheck = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	game_over_menu.visible =  false
	button.visible = false
	button_2.visible = false
	populateDialogueTree()
	setFileNumber()
	setAILevels()
	dialogue.play(dialogueTree["ready"], textureTree["ready"])

func setFileNumber():
	numberToCheck = 1
	
func setAILevels():
	ai_paddle.level = numberToCheck-1

func populateDialogueTree():
	var boyFace = load("res://Resources/Characters/BoyFace.png")
	dialogueTree = {"ready":["Let's play Pong!", "It's gonna be fun!"], "aiWin":["It's over? Already?", "But I had so much I wanted to try"], "playerWin":["It's over already?", "That was fun...",  "But my uncle is still stronger than you!"]}
	textureTree = {"ready":[boyFace,boyFace], "aiWin": [boyFace,boyFace], "playerWin": [boyFace,boyFace,boyFace]}

func _on_button_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_ai_score_detector_game_over():
	get_tree().paused = true
	game_over_menu.visible =  true
	button.visible = true
	button_2.visible = true
	#Play the losing dialogue
	dialogue.play(dialogueTree["aiWin"], textureTree["aiWin"])

func _on_player_score_detector_game_over():
	get_tree().paused = true
	game_over_menu.visible =  true
	game_over_menu.text = "You win!"
	button.visible = true
	button_2.visible = true
	#Update Save information
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		var currNumber = file.get_8()
		print(currNumber, " ", numberToCheck)
		file.close()
		if(currNumber < numberToCheck):
			var fileTemp = FileAccess.open(save_path, FileAccess.WRITE)
			fileTemp.store_8(numberToCheck)
			fileTemp.close()
	#Play the winning dialogue
	dialogue.play(dialogueTree["playerWin"], textureTree["playerWin"])

func _on_button_2_pressed():
	var scene = load("res://Menus/LevelSelect.tscn")
	scene.instantiate()
	get_tree().change_scene_to_packed(scene)
	get_tree().paused = false
