extends BallResource
class_name ActionBallResource

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 


export(Array, Resource) var hits

var currentHits = []


# warning-ignore:shadowed_variable
# Called when the node enters the scene tree for the first time.
func _init(hits = []):
	self.hits = hits


#manual duplication due to godot not doing it correctly
func setHits():
	self.currentHits = []
	for i in hits.size():
		var hit = hits[i] as Hit
		var duplicated = hit.duplicate() as Hit
		self.currentHits.push_front(duplicated)


func customAction(peg) -> bool:
	var resolveHit = true
	if(currentHits.size() != 0):
		for i in currentHits.size():
			resolveHit = currentHits[i].onHit(peg, currentPayload, outcomes)
	else:
		for i in hits.size():
			resolveHit = hits[i].onHit(peg, currentPayload, outcomes)
	return resolveHit
