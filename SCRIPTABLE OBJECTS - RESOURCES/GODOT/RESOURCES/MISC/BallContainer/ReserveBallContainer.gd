extends GridContainer



var reserveArray := []
var control
var discardEmpty = false
func _ready():
	control = get_child(0)
	remove_child(control)

signal SendDiscardBack(amt, location)
signal SendToNewLocation(ball, location)


func _on_DiscardGiveBalls(arrayOfBalls, amt, location):
	_on_Player_Panel_addToReserve(arrayOfBalls)
	_on_Player_Panel_removeAmtFromReserve(amt, location)


func _on_Player_Panel_addToReserve(arrayOfBalls):
	randomize();
	arrayOfBalls.shuffle()
	for i in arrayOfBalls:
		var newControl = control.duplicate()
		newControl.set_mouse_filter(MOUSE_FILTER_IGNORE)
		newControl.set_custom_minimum_size(Vector2(50,50))
		var newBall = i.instance()
		newBall.ballIsStatic = true
		newControl.add_child(newBall)
		newBall.position = Vector2(25,25)
		self.add_child(newControl)
		newBall.stopBouncingPhysics()
		reserveArray.push_front(i)


func _on_Player_Panel_removeAmtFromReserve(amt, location):
	var rng = RandomNumberGenerator.new()
	if(amt > reserveArray.size() && discardEmpty == false):
		discardEmpty = true
		emit_signal("SendDiscardBack", amt, location)
	elif(discardEmpty):
		var size = reserveArray.size()
		for i in size:
			var randIndex = rng.randi_range(0, reserveArray.size()-1)
			emit_signal("SendToNewLocation", reserveArray[randIndex], location)
			reserveArray.remove(randIndex)
			remove_child(get_child(randIndex))
		discardEmpty = false
	else:
		for i in amt:
			var randIndex = rng.randi_range(0, reserveArray.size()-1)
			emit_signal("SendToNewLocation", reserveArray[randIndex], location)
			reserveArray.remove(randIndex)
			remove_child(get_child(randIndex))
		discardEmpty = false


func _on_Player_Panel_removeFromReserve(ball, location):
	var index = reserveArray.find(ball)
	if(index != -1):
		reserveArray.remove(index)
		emit_signal("SendToNewLocation", ball, location)
