extends MarginContainer

@onready var path = "res://"+self.name+"/"+self.name+".tscn"
@export var stringName : String
@export var image : Texture2D
@onready var label = $VBox/Label
@onready var texture_rect = $VBox/TextureRect
var locked = true
var number

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = stringName
	texture_rect.texture = image
	var _unlocked = 0
	number = self.name.get_slice("Level",1).to_int()


func checkIfUnlocked(unlockedNumber):
	if(number <= unlockedNumber):
		locked = false
	if(locked):
		self.visible = false

func _on_mouse_entered():
	if(!locked):
		self.modulate = Color.RED

func _on_mouse_exited():
	if(!locked):
		self.modulate = Color.GRAY

func _on_button_pressed():
	if(locked):
		print("locked")
		return
	var scene = load(path)
	scene.instantiate()
	get_tree().change_scene_to_packed(scene)
