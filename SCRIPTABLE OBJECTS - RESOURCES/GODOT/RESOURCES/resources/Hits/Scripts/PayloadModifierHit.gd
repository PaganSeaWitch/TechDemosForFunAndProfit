extends Hit
class_name PayloadModifierHit

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 

export(String) var team
export(String) var value
export(float) var reduceByOnNegativeHits
export(float) var increaseByOnPositiveHits 

func onPositivePegHit(_peg, initalPayload, _outcomes):
	if(!initalPayload.has(team)):
		initalPayload[team] = {}
	if(initalPayload[team].has(value)):
		initalPayload[team][value] += increaseByOnPositiveHits
	else:
		initalPayload[team][value] = increaseByOnPositiveHits
	return true

func onNegativePegHit(_peg, initalPayload, _outcomes):
	if(!initalPayload.has(team)):
		initalPayload[team] = {}
	if(initalPayload[team].has(value)):
		initalPayload[team][value] -= reduceByOnNegativeHits
	else:
		initalPayload[team][value] = -1 * reduceByOnNegativeHits
	return true
