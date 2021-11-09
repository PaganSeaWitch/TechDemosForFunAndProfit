extends PaintBall
class_name PaintYellowBall

func _ready():
	ColorArray = [Color(255, 255, 0)]
	colorTypeArray = [YellowPeg]

func ResolvePegHit(peg):
	.ResolvePegHit(peg)
	
