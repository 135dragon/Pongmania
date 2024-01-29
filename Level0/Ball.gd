extends CharacterBody2D
@onready var pop_sound = $PopSound
@onready var light = $PointLight2D

var speed = 5
var maxSpeed = 15
var accelerationY = 0
var accelerationX = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x = -1 * speed
	velocity.y = speed
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var collision = move_and_collide(velocity)
	if(collision):
		##
		#Only changes color / picks up speed when colliding with a paddle
		if(collision.get_collider().to_string().contains("Paddle")):
			accelerationY = 0
			accelerationX = 0
			light.color = Color(randf(),randf(),randf())
			if(light.energy < 10):
				light.energy = light.energy * 1.1
			pop_sound.play()
			speed = speed*1.1
			if(speed > maxSpeed):
				speed = maxSpeed
		if(collision.get_collider().has_method("special")):
			collision.get_collider().special(self)
		#Always bounces off of a collision
		velocity = velocity.bounce(collision.get_normal()).normalized()*speed
	#Always Runs
	velocity.y = velocity.y + accelerationY
	velocity.x = velocity.x + accelerationX
	velocity = velocity.clamp(Vector2(-maxSpeed, -maxSpeed), Vector2(maxSpeed,maxSpeed))


func resetSpeed():
	position.x = 600
	light.energy = 5
	speed = 5
	accelerationY = 0
	accelerationX = 0
	maxSpeed = 20
	velocity.x = -1 * speed
	velocity.y = [-1,1].pick_random() * speed
	light.color = Color.WHITE
