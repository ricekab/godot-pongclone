extends Node2D

var Paddle = preload("res://entities/paddle.tscn")
var BallScript = preload("res://scripts/ball.gd")

var RNG = RandomNumberGenerator.new()

signal score_changed(left_score, right_score)

var score_left = 0
var score_right = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_game_ui_btn_pressed():
	_spawn_new_ball()

func _spawn_new_ball():
	var new_ball = Paddle.instance()
	new_ball.set_script(BallScript)
	new_ball.position = Vector2(400, 300)
	var rand_x = RNG.randf_range(0.5, 1.0)
	var rand_y = RNG.randf_range(-1.0, 1.0)
	var random_vel_normalized = Vector2(rand_x, rand_y).normalized()
	new_ball.vel = random_vel_normalized * 100.0  # Initial speed
	new_ball.set_collision_mask(3)  # layer 1 + 2
	add_child(new_ball)


func _on_left_score_area_body_entered(body):
	score_right += 1
	emit_signal("score_changed", score_left, score_right)
	body.queue_free()
	_spawn_new_ball()


func _on_right_score_area_body_entered(body: PhysicsBody2D):
	score_left += 1
	emit_signal("score_changed", score_left, score_right)
	body.queue_free()
	_spawn_new_ball()
