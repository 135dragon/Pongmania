extends "res://Level0/Level0.gd"


func populateDialogueTree():
	var a = load("res://Resources/Characters/UncleFace.png")
	dialogueTree = {"ready":["So you're the one who beat my niece.", "Well, you aren't going to beat me.", "Fair Warning, I have a trick up my sleeve"], "aiWin":["Ha, can't beat my curve shots can you?"], "playerWin":["I've lost", "Well Played"]}
	textureTree = {"ready":[a,a,a], "aiWin": [a], "playerWin": [a,a,a]}

func setFileNumber():
	numberToCheck = 2
