extends CharacterBody2D

var screen_size
var speed = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position = position.clamp(Vector2.ZERO, Vector2(1000,660))
	handleInput()
#	friction()

@onready var ball = $"../Ball"

func handleInput():
#	position.y = ball.position.y
#	return
	var distanceTo = position.y - get_global_mouse_position().y
	velocity.y = -distanceTo
	velocity = velocity.clamp(Vector2(-speed, -speed), Vector2(speed, speed))
	position = position.clamp(Vector2.ZERO, Vector2(1000,680))
	move_and_collide(velocity)
	#	position.y = get_global_mouse_position().y

#func friction():
#	velocity = velocity * 0.9
#	if(velocity.length() < 0.1):
#		velocity = Vector2(0,0)
