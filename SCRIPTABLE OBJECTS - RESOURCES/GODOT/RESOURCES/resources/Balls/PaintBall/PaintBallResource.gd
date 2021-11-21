extends ActionBallResource
class_name PaintBallResource

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Array) var colorArray
export(Array) var colorTypeArray

# Called when the node enters the scene tree for the first time.
func _init(colorArray = [], colorTypeArray = []):
	self.colorArray = colorArray
	self.colorTypeArray = colorTypeArray


func customAction(peg):
	paint(peg)


func paint(peg):
	var shouldChange = true
	for n in range(colorTypeArray.size()):
		if(peg is colorTypeArray[n]):
			shouldChange = false
	if(shouldChange == true):
		peg.changeColor(colorArray)
