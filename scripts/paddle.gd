extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var ACCELERATION : float = 1.0
var velocity : float = 0.0
export var MAX_VELOCITY : float = 1.0

export var DOWN_KEY = "ui_left"
export var UP_KEY = "ui_right"

const SLOWDOWN_FACTOR = 0.35  # "Drag" when no input is given.

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = 0
	pass # Replace with function body.

func _physics_process(delta: float):
	var direction = 0
	var velocity_difference: float
	if Input.is_action_pressed(UP_KEY):
		direction = 1
	if Input.is_action_pressed(DOWN_KEY):
		direction = -1
	if not direction:
		velocity_difference = velocity * (ACCELERATION * SLOWDOWN_FACTOR) * delta * -1
	else:
		velocity_difference = ACCELERATION * direction * delta
	velocity += velocity_difference
	velocity = clamp(velocity, -1 * MAX_VELOCITY, MAX_VELOCITY)
	var vel_vector = Vector2(0, velocity)
	var collisionInfo = move_and_collide(vel_vector)
	if collisionInfo:
		# Lost half speed on collision
		vel_vector = vel_vector.bounce(collisionInfo.normal) / 2
		velocity = vel_vector.y
	#position.y += velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
