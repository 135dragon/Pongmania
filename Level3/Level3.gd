extends "res://Level0/Level0.gd"


func populateDialogueTree():
	var a = load("res://Resources/Characters/BodyguardFace.png")
	dialogueTree = {"ready":["So you want to enter the esteemed neighborhood tournament...", "You will have to defeat me first!", "Oh, the suit? Don't worry about it"], "aiWin":["So weak...", "And you thought you could enter the finals?"], "playerWin":["Ugh...", "Fine, you can enter the finals...", "I don't even work here"]}
	textureTree = {"ready":[a,a, a], "aiWin": [a,a], "playerWin": [a,a]}
func setFileNumber():
	numberToCheck = 4
