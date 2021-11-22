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
			return onPositivePegHit(peg, initalPayload)
	for i in negativePegs.size():
		if(peg is negativePegs[i]):
			return onNegativePegHit(peg, initalPayload)
	return true


func onPositivePegHit(peg, initalPayload)-> bool:
	return true


func onNegativePegHit(peg, initalPayload)-> bool:
	return true