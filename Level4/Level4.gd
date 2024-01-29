extends "res://Level0/Level0.gd"


func populateDialogueTree():
	var a = load("res://Resources/Characters/LocalChampionFace.png")
	dialogueTree = {"ready":["Huh? How did you get here?", "Huh? My paddle? Completely regulation I assure you.", "Enough Questions! Let's fight!"], "aiWin":["Still the reigning champion, ha!", "All the bribes were worth it."], "playerWin":["Ugh...", "How did you defeat me?", "I even bribed all the other contestants to leave..."]}
	textureTree = {"ready":[a,a,a], "aiWin": [a,a], "playerWin": [a,a,a]}
func setFileNumber():
	numberToCheck = 5
