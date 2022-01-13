extends GridContainer

# TITLE : ReserveBallContainer
# Functions : getControl, _on_Player_Panel_addToReserve, _on_DiscardGiveBalls,
#		_on_Player_Panel_removeAmtFromReserve, _on_Player_Panel_removeFromReserve,
#		sendBall
# Purpose: Contains and displays balls that are still in Reserve
# Closely Connected Scripts : PlayerPanel, DiscardBallContainer


# Connected To : DiscardBallContainer
# Purpose : Empties discard and adds the balls to Reserve
signal SendDiscardBack(amt, location)


# Connected To : PlayerPanel
# Purpose : Sends a specific ball to a new location
signal SendToNewLocation(ball, location)


#container for reserve balls
var reserveArray := []

var control : Control

#used to check whether we have already emptied the discard
var discardEmpty := false


# Received From : PlayerPanel
# Purpose : removes an amt of balls from reserve to be put into play
# IF an amt of balls can't be aquired, the discard is emptied and put into reserve
# IF there still isn't the amt of balls required, it gives the entire reserve
func _on_Player_Panel_removeAmtFromReserve(amt : int, location : int) -> void:
	var rng = RandomNumberGenerator.new()
	
	#Empty Discard if not enough balls
	if(amt > reserveArray.size() && discardEmpty == false):
		discardEmpty = true
		emit_signal("SendDiscardBack", amt, location)
		
	#If Discard has already emptied, empty reserve
	elif(discardEmpty):
		var size = reserveArray.size()
		for i in size:
			sendBall(location)
		discardEmpty = false
	
	#put amt of balls requested in play
	else:
		for i in amt:
			sendBall(location)
		discardEmpty = false


# Received From : DiscardBallContainer
# Purpose : Recievies all the discard balls and puts them into reserve
func _on_DiscardGiveBalls(arrayOfBalls : Array, amt : int, location : int) -> void:
	_on_Player_Panel_addToReserve(arrayOfBalls)
	_on_Player_Panel_removeAmtFromReserve(amt, location)


# Received From : PlayerPanel
# Purpose : adds an array of balls to reserve
func _on_Player_Panel_addToReserve(arrayOfBalls : Array) -> void:
	randomize()
	if(control == null):
		getControl()
	arrayOfBalls.shuffle()
	for i in arrayOfBalls:
		
		#Set up Control node
		var newControl = control.duplicate()
		newControl.set_mouse_filter(MOUSE_FILTER_IGNORE)
		newControl.set_custom_minimum_size(Vector2(50,50))
		
		#Set up new Ball instance
		var newBall = i.instance()
		newBall.ballIsStatic = true
		newControl.add_child(newBall)
		newBall.position = Vector2(25,25)
		self.add_child(newControl)
		newBall.stopBouncingPhysics()
		reserveArray.push_front(i)


# NOT IMPLEMENTED YET
# Purpose : Removes A Specific ball From Reserve
func _on_Player_Panel_removeFromReserve(ball : PackedScene, location : int) -> void:
	var index = reserveArray.find(ball)
	if(index != -1):
		reserveArray.remove(index)
		emit_signal("SendToNewLocation", ball, location)


# Purpose : Sends a random ball to a new location
func sendBall(location):
	var rng = RandomNumberGenerator.new()
	var randIndex = rng.randi_range(0, reserveArray.size()-1)
	emit_signal("SendToNewLocation", reserveArray[randIndex], location)
	reserveArray.remove(randIndex)
	remove_child(get_child(randIndex))


# Purpose : used to get the generic control node (Don't ask me whether this is the best way to do this)
func getControl() -> void:
	control = get_child(0)
	remove_child(control)
