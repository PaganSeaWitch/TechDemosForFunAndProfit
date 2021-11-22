extends BallResource
class_name ActionBallResource

export(Array, Resource) var hits


# Called when the node enters the scene tree for the first time.
func _init(hits = []):
	self.hits = hits

func customAction(peg) -> bool:
	var resolveHit = true
	for i in hits.size():
		resolveHit = hits[i].onHit(peg, initalPayload)
	return resolveHit
