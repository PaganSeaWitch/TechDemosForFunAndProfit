extends Resource
class_name EnemyResource

# TITLE : EnemyResource
# Functions : _init
# Purpose : Creates Enemys
# Closely Connected Scripts : 


export(String, MULTILINE) var name
export(String, MULTILINE) var description
export(Texture) var texture
export(Array, Resource) var moves
export(int) var currentHealth
export(int) var maxHealth




# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
func _init(currentHealth = 10,maxHealth = 10, texture = null, moves = [], name = "", description = ""):
	self.currentHealth = currentHealth
	self.maxHealth = maxHealth
	self.texture = texture
	self.moves = moves
	self.name = name
	self.description = description
