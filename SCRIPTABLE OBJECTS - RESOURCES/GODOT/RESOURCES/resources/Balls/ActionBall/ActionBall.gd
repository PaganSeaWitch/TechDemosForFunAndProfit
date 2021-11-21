extends PachinkoBall
class_name ActionBall

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var payloads

# Called when the node enters the scene tree for the first time.
func _ready():
	var resource = ballResource as ActionBallResource
	self.payloads = resource.payloads

func ResolvePegHit(peg):
	.ResolvePegHit(peg)
	ballResource.customAction(peg)


