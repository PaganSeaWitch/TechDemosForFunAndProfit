extends PachinkoBall
class_name ActionBall

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var hits

# Called when the node enters the scene tree for the first time.
func _on_GENERIC_BALL_transferResources(ballResource):
	._on_GENERIC_BALL_transferResources(ballResource)
	self.hits = ballResource.hits

func ResolvePegHit(peg):
	if(ballResource.customAction(peg)):
		.ResolvePegHit(peg)



