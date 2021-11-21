extends ActionBall
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
