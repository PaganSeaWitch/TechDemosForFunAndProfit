extends BallResource
class_name ActionBallResource

export(Array) var payloads


# Called when the node enters the scene tree for the first time.
func _init(payloads = []):
	self.payloads = payloads

func customAction(peg):
	for i in payloads.size():
		if(peg is payloads[i].peg):
			if(initalPayload.has(payloads[i].type)):
				initalPayload[payloads[i].type] += payloads[i].amount
			else:
				initalPayload[payloads[i].type] = payloads[i].amount
