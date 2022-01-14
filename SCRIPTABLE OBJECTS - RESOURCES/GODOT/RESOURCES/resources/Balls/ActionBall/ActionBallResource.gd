extends BallResource
class_name ActionBallResource

# TITLE : ActionBallResource
# Functions : _init, setHits, customAction
# Purpose : Creates an action ball resource
# Closely Connected Scripts : BallResource


export(Array, Resource) var hits

var currentHits := []


# warning-ignore:shadowed_variable
# Purpose : initilizes resource
func _init(hits = []) -> void:
	self.hits = hits


# Purpose : manual duplication due to godot not doing it correctly
func setHits() -> void:
	self.currentHits = []
	for i in hits.size():
		var hit = hits[i] as Hit
		var duplicated = hit.duplicate() as Hit
		self.currentHits.push_front(duplicated)

# Purpose : allows for custom actions to happen when ball hit peg
func customAction(peg : Peg) -> bool:
	var resolveHit := true
	if(currentHits.size() != 0):
		for i in currentHits.size():
			resolveHit = currentHits[i].onHit(peg, currentPayload, outcomes)
	else:
		for i in hits.size():
			resolveHit = hits[i].onHit(peg, currentPayload, outcomes)
	return resolveHit
