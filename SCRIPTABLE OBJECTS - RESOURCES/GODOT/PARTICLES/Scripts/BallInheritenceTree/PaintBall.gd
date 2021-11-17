extends PachinkoBall
class_name PaintBall

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var colorArray
var colorTypeArray

func _ready():
	var resource = ballResource as PaintBallResource
	self.colorArray = resource.colorArray
	self.colorTypeArray = resource.colorTypeArray



# Called every frame. 'delta' is the elapsed time since the previous frame.
func ResolvePegHit(peg):
	.ResolvePegHit(peg)
	var shouldChange = true
	for n in range(colorTypeArray.size()):
		if(peg is colorTypeArray[n]):
			shouldChange = false
	if(shouldChange == true):
		peg.changeColor(colorArray)
