extends CharacterBody2D


@onready var ball: CharacterBody2D = $"../Ball"
var speed = 600
var screen_size
var level = 1
#temporary variable
var allBricksBroken = true
signal stunned
@onready var dialogue = $"../UI/DialogueHBox"

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position.y = ball.position.y
	var distanceTo = position.y - ball.position.y
	velocity.y = -distanceTo
	velocity = velocity.normalized() * speed
	velocity = velocity.clamp(Vector2(-speed, -speed), Vector2(speed, speed))
	position = position.clamp(Vector2.ZERO, Vector2(1000,680))
	var _collision = move_and_collide(velocity * delta)
	
func updateLevel(a):
	level = a

func special(a):
	if(level == 1):
		a.maxSpeed = 25
		a.accelerationY = randf_range(-0.5, 0.5)
	if(level == 2):
		a.maxSpeed = 30
		a.accelerationX = -0.25
		a.velocity.y = a.velocity.y * 2
	if(level == 3):
		speed = 850
		if(allBricksBroken):
			allBricksBroken = false
		#create a brick wall, atari breakout style
			var scene  = load("res://Specials/breakout.tscn").instantiate()
			#once the last brick is defeated, the bodyguard is stunned
			scene.allBricksBroken.connect(stun)
			scene.position.y = 10
			scene.position.x = self.position.x - 100
			self.get_parent().add_child(scene)
			await stunned
			dialogue.play(["My bricks!!!", "Do you know how expensive they are?"],[])
			allBricksBroken = true
	if(level == 4):
		a.accelerationY = randf_range(-0.5, 0.5)
		a.accelerationX = randf_range(-0.25, 0.25)
		a.maxSpeed = 30
		if(allBricksBroken):
			allBricksBroken = false
			#create a brick wall, atari breakout style
			var scene  = load("res://Specials/breakout.tscn").instantiate()
			#once the last brick is defeated, the bodyguard is stunned
			scene.allBricksBroken.connect(stun)
			scene.position.y = 10
			scene.position.x = self.position.x - 100
			self.get_parent().add_child(scene)
			await stunned
			dialogue.play(["Ugh...why can't I move?"],[])
			allBricksBroken = true
func stun():
	speed = 0
	stunned.emit()
	await get_tree().create_timer(5).timeout
	speed = 850
	
