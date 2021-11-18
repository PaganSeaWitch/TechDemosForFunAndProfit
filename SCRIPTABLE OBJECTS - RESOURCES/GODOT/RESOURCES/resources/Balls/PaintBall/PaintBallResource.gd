extends BallResource
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
