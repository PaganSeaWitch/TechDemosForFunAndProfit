extends GridContainer

# TITLE : DiscardBallContainer
# Functions : _on_Player_Panel_removeFromDiscard, _on_Player_panel_addToDiscard,
#		_on_GridContainer_SendDiscardBack, _ready
# Purpose: Contains and displays balls that have been discarded by the player
# Closely Connected Scripts : PlayerPanel, ReserveBallContainer


# Contected To : PlayerPanel
# Purpose : Sends a ball to PlayerPanel to be assigned to a new location
signal SendToNewLocation(ball, location)

# Contected To : ReserveBallContainer
# Purpose : Sends All the Discarded Balls To Reserve for use
signal SendDiscardBack(ballArray, amt, location)

#container for discarded balls
var discardArray := []

var control : Control


# Recieved From : PlayerPanel
# Purpose : finds a ball in the discard and sends it back to PlayerPanel
func _on_Player_Panel_removeFromDiscard(ball : PackedScene, location : int) ->void:
	var index = discardArray.find(ball)
	if(index != -1):
		discardArray.remove(index)
		emit_signal("SendToNewLocation", ball, location)


#Recieved From : PlayerPanel
# Purpose : Adds recieved array of balls to the discard
func _on_Player_Panel_addToDiscard(arrayOfBalls : Array) -> void:
	for i in arrayOfBalls:
		
		#set up control for display
		var newControl = control.duplicate()
		newControl.set_mouse_filter(MOUSE_FILTER_IGNORE)
		newControl.set_custom_minimum_size(Vector2(50,50))
		self.add_child(newControl)
		
		#adds ball to control
		var newBall = i.instance()
		newBall.ballIsStatic = true
		discardArray.push_front(i)
		newControl.add_child(newBall)
		newBall.position = Vector2(25,25)


#Recieved From : ReserveBallContainer
# Purpose : Empties DiscardArray and sends the balls to PlayerPanel for relocation
func _on_GridContainer_SendDiscardBack(amt : int, location : int) -> void:
	var tempArray =[]
	tempArray.append_array(discardArray)
	for i in discardArray.size():
		remove_child(self.get_child(0))
		discardArray.remove(0)
	emit_signal("SendDiscardBack", tempArray, amt, location)


# Purpose : gets a control node for usage (Don't ask me whether this is the best way to do this)
func _ready() -> void:
	control = get_child(0)
	remove_child(control)
