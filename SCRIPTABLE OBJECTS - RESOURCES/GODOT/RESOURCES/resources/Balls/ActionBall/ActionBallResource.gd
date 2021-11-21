extends BallResource
class_name ActionBallResource

export(Array, Resource) var payloads


# Called when the node enters the scene tree for the first time.
func _init(payloads = []):
	self.payloads = payloads

func customAction(peg) -> bool:
	var resolveHit = false
	for i in payloads.size():
		resolveHit = payloads[i].onHit(peg, initalPayload)
	return resolveHit
