extends Resource
class_name Hit
export(Array, Script) var positivePegs
export(Array, Script) var negativePegs

func _init(positivePegs = [], negativePegs = []):
	self.positivePegs = positivePegs
	self.negativePegs = negativePegs

func onHit(peg, initalPayload) -> bool:
	for i in positivePegs.size():
		if(peg is positivePegs[i]):
			onPositivePegHit(peg, initalPayload)
			return true
	for i in negativePegs.size():
		if(peg is negativePegs[i]):
			onNegativePegHit(peg, initalPayload)
			return true
	return false


func onPositivePegHit(peg, initalPayload):
	pass


func onNegativePegHit(peg, initalPayload):
	pass
