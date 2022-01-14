extends PachinkoBall
class_name ActionBall

# TITLE : ActionBall
# Functions : _on_GENERIC_BALL_transferResources, ResolvePegHit
# Purpose : To allow for balls to enact their custom actions
# Closely Connected Scripts : PachinkoBall, GenericBall


var hits : Array


# Recieved From : GenericBall
# Purpose : transfers resources to ball
func _on_GENERIC_BALL_transferResources(ballResource : BallResource):
	._on_GENERIC_BALL_transferResources(ballResource)
	self.hits = ballResource.currentHits


# Purpose : resolves peg hits
func ResolvePegHit(peg : Peg):
	if(ballResource.customAction(peg)):
		.ResolvePegHit(peg)
