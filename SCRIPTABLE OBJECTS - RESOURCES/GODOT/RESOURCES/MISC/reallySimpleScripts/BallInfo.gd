extends Control

# TITLE : BallInfo
# Functions : _on_BALL_mouse_entered, _on_BALL_mouse_exited, _on_BALL_beingDragged,
#		_on_BALL_turnOff
# Purpose : Toggles whether a ball's info is shown
# Closely Connected Scripts : 


var beingDragged := false

# Recieved From : Ball
# Purpose : shows info
func _on_BALL_mouse_entered():
	if(self.visible == false):
		print('turn on')
		self.visible = true

# Recieved From : Ball
# Purpose : vanishes info
func _on_BALL_mouse_exited():
	if(!beingDragged):
		self.visible = false


# Recieved From : Ball
# Purpose : sets dragging
func _on_BALL_beingDragged(isBeingDragged : bool):
	beingDragged = isBeingDragged

# Recieved From : Ball
# Purpose : vanishes info
func _on_BALL_turnOff():
	self.visible = false
