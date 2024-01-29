extends Area2D

@export var label: Label
@onready var score_sound = $ScoreSound
signal gameOver
@onready var ball = $"../Ball"

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "0"

func _on_body_entered(body):
	if(body != ball):
		return
	body.position = Vector2(500,300)
	label.text = str(int(label.text) + 1)
	score_sound.play()
	if(body.has_method("resetSpeed")):
		body.resetSpeed()
	var number = int(label.text)
	if(number >= 5):
		gameOver.emit()
