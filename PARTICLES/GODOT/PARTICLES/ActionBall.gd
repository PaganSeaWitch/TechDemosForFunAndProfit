extends PachinkoBall
class_name ActionBall

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var worksOnArray

# Called when the node enters the scene tree for the first time.
func _ready():
	worksOnArray = [Peg]

func ResolvePegHit(peg):
	.ResolvePegHit(peg)
	for n in range(worksOnArray.size()):
		if(peg is worksOnArray[n]):
			customAction(peg)
			break

func customAction(peg):
	pass

