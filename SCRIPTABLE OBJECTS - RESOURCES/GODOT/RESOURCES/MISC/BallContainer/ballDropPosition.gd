extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ball = load("res://resources/Balls/GenericBall/GenericBall.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BallCarrier_dropNext():
	var newBall = ball.instance()
	get_parent().add_child(newBall)
	newBall.position = self.position
