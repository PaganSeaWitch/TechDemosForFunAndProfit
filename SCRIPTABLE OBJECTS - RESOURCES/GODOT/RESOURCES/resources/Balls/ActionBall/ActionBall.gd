extends PachinkoBall
class_name ActionBall

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var hits

# Called when the node enters the scene tree for the first time.
func _on_GENERIC_BALL_transferResources(ballResource):
	._on_GENERIC_BALL_transferResources(ballResource)
	self.hits = ballResource.currentHits

func ResolvePegHit(peg):
	if(ballResource.customAction(peg)):
		.ResolvePegHit(peg)



