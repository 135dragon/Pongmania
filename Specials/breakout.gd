extends Node2D

signal allBricksBroken
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(13):
		var scene  = load("res://Specials/brick.tscn").instantiate()
		scene.position.y = i * 50
		scene.brickBreak.connect(_on_brick_break)
		self.add_child(scene)


func _on_brick_break():
	if(get_child_count() == 1):
		allBricksBroken.emit()
