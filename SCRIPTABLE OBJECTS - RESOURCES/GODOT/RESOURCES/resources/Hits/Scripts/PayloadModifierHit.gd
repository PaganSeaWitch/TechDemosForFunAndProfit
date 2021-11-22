extends Hit
class_name PayloadModifierHit


export(String) var value
export(int) var reduceByOnNegativeHits
export(int) var increaseByOnPositiveHits 

func onPositivePegHit(peg, initalPayload):
	if(initalPayload.has(value)):
		initalPayload[value] += increaseByOnPositiveHits
	else:
		initalPayload[value] = increaseByOnPositiveHits
	return true

func onNegativePegHit(peg, initalPayload):
	if(initalPayload.has(value)):
		initalPayload[value] -= reduceByOnNegativeHits
	else:
		initalPayload[value] = -1 * reduceByOnNegativeHits
	return true
