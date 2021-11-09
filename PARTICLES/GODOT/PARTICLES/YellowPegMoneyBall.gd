extends YellowPegBall
class_name YellowPegMoneyball

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var moneyGainedPerPegHit = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	payloadDictionary["money"] = 0



func customAction(peg):
	payloadDictionary["money"] += moneyGainedPerPegHit
