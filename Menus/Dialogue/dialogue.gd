extends HBoxContainer
@onready var label = $Label
@onready var texture_rect = $TextureRect

var texture = []
signal dialogueOver
var dialogue = []
# Called when the node enters the scene tree for the first time.

func play(array, textureArray):
	dialogue = array
	texture = textureArray
	#Pause the game if not already paused
	var alreadyPaused = get_tree().paused
	if(!alreadyPaused):
		get_tree().paused = true
	
	self.visible = true
	label.text = dialogue.pop_front()
	texture_rect.texture = texture.pop_front()
	await dialogueOver
	self.visible = false
	#If not already paused, remember to unpause once the dialogue is over.
	if(!alreadyPaused):
		get_tree().paused = false

func _on_button_pressed():
	if(dialogue.is_empty()):
		dialogueOver.emit()
		return
	label.text = dialogue.pop_front()
	texture_rect.texture = texture.pop_front()
