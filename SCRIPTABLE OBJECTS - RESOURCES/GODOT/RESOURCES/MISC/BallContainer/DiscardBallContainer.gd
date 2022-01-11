extends GridContainer


# Declare member variables here. Examples:
# var a = 2
var discardArray := []
var control

signal SendToNewLocation(ball, location)
signal SendDiscardBack(ballArray, amt, location)
# Called when the node enters the scene tree for the first time.
func _ready():
	control = get_child(0)
	remove_child(control)


func _on_Player_Panel_removeFromDiscard(ball, location):
	var index = discardArray.find(ball)
	if(index != -1):
		discardArray.remove(index)
		emit_signal("SendToNewLocation", ball, location)


func _on_Player_Panel_addToDiscard(arrayOfBalls):
	for i in arrayOfBalls:
		var newControl = control.duplicate()
		newControl.set_mouse_filter(MOUSE_FILTER_IGNORE)
		newControl.set_custom_minimum_size(Vector2(50,50))
		self.add_child(newControl)
		var newBall = i.instance()
		newBall.ballIsStatic = true
		discardArray.push_front(i)
		newControl.add_child(newBall)
		newBall.position = Vector2(25,25)

func _on_GridContainer_SendDiscardBack(amt, location):
	var tempArray =[]
	tempArray.append_array(discardArray)
	for i in discardArray.size():
		remove_child(self.get_child(0))
		discardArray.remove(0)
	emit_signal("SendDiscardBack", tempArray, amt, location)
