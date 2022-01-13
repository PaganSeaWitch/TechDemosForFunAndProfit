extends Resource
class_name AbilityInfo

# TITLE : AbilityInfoResource
# Functions : _init
# Purpose: Creates A Resource That Is Used To Create Visual Information About A Ball's Ability
# Closely Related Scripts : AbilityInfoPanel

export(int) var amount : int
export(Texture) var type : Texture
export(PackedScene) var peg : PackedScene
export(int) var perAmount : int

# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# Called when the node enters the scene tree for the first time.
func _init(amount := 0, type := null, peg := null, perAmount := 0) -> void:
	self.amount = amount
	self.type = type
	self.peg = peg
	self.perAmount = perAmount
