extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var vel = Vector2(1, 1)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta: float):
	var collisionInfo = move_and_collide(vel * delta)
	if collisionInfo:
		vel = vel.bounce(collisionInfo.normal)
		print(collisionInfo)
