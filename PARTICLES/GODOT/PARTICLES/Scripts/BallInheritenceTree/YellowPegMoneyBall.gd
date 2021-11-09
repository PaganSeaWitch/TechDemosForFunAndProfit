extends YellowPegBall
class_name YellowPegMoneyball


var moneyGainedPerPegHit = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	payloadDictionary["money"] = 0



func customAction(peg):
	payloadDictionary["money"] += moneyGainedPerPegHit
