extends "res://Level0/Level0.gd"


func populateDialogueTree():
	var a = load("res://Resources/Characters/PasserbyFace.png")
	dialogueTree = {"ready":["Your previous game was interesting...", "But my games tend to quicker"], "aiWin":["Well played", "That was a nice warm-up"], "playerWin":["Good Game", "You know, there's a neighborhood wide pong tournament going on..."]}
	textureTree = {"ready":[a,a], "aiWin": [a,a], "playerWin": [a,a]}
func setFileNumber():
	numberToCheck = 3
