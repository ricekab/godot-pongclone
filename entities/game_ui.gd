extends Control

signal btn_pressed

onready var scoreLabel = $score

# Called when the node enters the scene tree for the first time.
func _ready():
	scoreLabel.text = "0 - 0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_button_pressed():
	emit_signal('btn_pressed')


func _on_game_root_score_changed(left_score, right_score):
	scoreLabel.text = "{0} - {1}".format([left_score, right_score])
