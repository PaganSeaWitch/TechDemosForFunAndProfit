extends Resource
class_name AbilityInfo

export(int) var amount
export(Texture) var type
export(PackedScene) var peg
export(int) var perAmount


# Called when the node enters the scene tree for the first time.
func _init(amount = 0, type = null, peg = null, perAmount = 0):
	self.amount = amount
	self.type = type
	self.peg = peg
	self.perAmount = perAmount
