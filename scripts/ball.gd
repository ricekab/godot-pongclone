extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var vel = Vector2(1, 1)
export var bounce_speed_scale = 1.10  # Vel increase on each bounce.

const MAX_SPEED = 450.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta: float):
	var collisionInfo = move_and_collide(vel * delta)
	if collisionInfo:
		if collisionInfo.collider.name == "paddle_p1" or \
			collisionInfo.collider.name == "paddle_p2":
			var towards = self.position
			var from = collisionInfo.collider.position
			var direction_vector: Vector2 =  towards - from
			direction_vector = direction_vector.normalized()
			vel = direction_vector * vel.length()
		else:
			vel = vel.bounce(collisionInfo.normal)
		vel *= bounce_speed_scale
		vel = vel.clamped(MAX_SPEED)
