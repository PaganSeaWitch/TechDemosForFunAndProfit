extends Resource
class_name PlayerResource

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 

# Declare member variables here. Examples:
export(String, MULTILINE) var name
export(Texture) var texture
export(Array, PackedScene) var balls
export(int) var currentHealth
export(int) var maxHealth
export(int) var maxEnergy
export(int) var money


# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
func _init(currentHealth = 10,maxHealth = 10, texture = null, name = "", balls = [], maxEnergy = 3, money = 10):
	self.currentHealth = currentHealth
	self.maxHealth = maxHealth
	self.texture = texture
	self.balls = balls
	self.name = name
	self.maxEnergy = maxEnergy
	self.money = money
