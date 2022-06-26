extends Node2D

var Paddle = preload("res://entities/paddle.tscn")
var BallScript = preload("res://scripts/ball.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_game_ui_btn_pressed():
	_spawn_new_ball()

func _spawn_new_ball():
	var new_ball = Paddle.instance()
	new_ball.set_script(BallScript)
	new_ball.position = Vector2(400, 300)
	new_ball.vel = Vector2(50, 50)
	new_ball.set_collision_mask(3)  # layer 1 + 2
	add_child(new_ball)


func _on_left_score_area_body_entered(body):
	print("RIGHT SIDE SCORED")
	print(body)


func _on_right_score_area_body_entered(body: PhysicsBody2D):
	print("LEFT SIDE SCORED")
	body.queue_free()
