extends Hit
class_name PayloadModifierHit

export(String) var team
export(String) var value
export(float) var reduceByOnNegativeHits
export(float) var increaseByOnPositiveHits 

func onPositivePegHit(peg, initalPayload, outcomes):
	if(!initalPayload.has(team)):
		initalPayload[team] = {}
	if(initalPayload[team].has(value)):
		initalPayload[team][value] += increaseByOnPositiveHits
	else:
		initalPayload[team][value] = increaseByOnPositiveHits
	return true

func onNegativePegHit(peg, initalPayload, outcomes):
	if(!initalPayload.has(team)):
		initalPayload[team] = {}
	if(initalPayload[team].has(value)):
		initalPayload[team][value] -= reduceByOnNegativeHits
	else:
		initalPayload[team][value] = -1 * reduceByOnNegativeHits
	return true
