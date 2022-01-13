extends Hit
class_name PaintHit

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 

export(Array, PackedScene) var colorArray
export(Array, Script) var colorTypeArray

func _init(colorArray = [], colorTypeArray = []):
	self.colorArray = colorArray
	self.colorTypeArray = colorTypeArray

func onPositivePegHit(peg, initalPayload, outcomes):
	var shouldChange = true
	for n in range(colorTypeArray.size()):
		if(peg is colorTypeArray[n]):
			shouldChange = false
	if(shouldChange == true):
		peg.changeColor(colorArray)
	return true
