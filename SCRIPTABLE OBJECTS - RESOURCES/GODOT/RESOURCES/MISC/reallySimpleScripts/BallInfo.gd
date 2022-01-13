extends Control

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var beingDragged = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BALL_mouse_entered():
	if(self.visible == false):
		print('turn on')
		self.visible = true


func _on_BALL_mouse_exited():
	if(!beingDragged):
		self.visible = false



func _on_BALL_beingDragged(isBeingDragged):
	beingDragged = isBeingDragged


func _on_BALL_turnOff():
	self.visible = false
