extends PachinkoBall
class_name PaintBall

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ColorArray
var colorTypeArray





# Called every frame. 'delta' is the elapsed time since the previous frame.
func ResolvePegHit(peg):
	.ResolvePegHit(peg)
	var shouldChange = true
	for n in range(colorTypeArray.size()):
		if(peg is colorTypeArray[n]):
			shouldChange = false
	if(shouldChange == true):
		peg.changeColor(ColorArray)
