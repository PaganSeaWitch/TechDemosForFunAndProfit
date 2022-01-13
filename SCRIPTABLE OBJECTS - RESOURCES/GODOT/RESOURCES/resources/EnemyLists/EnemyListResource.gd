extends Resource
class_name EnemyList

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 

# Declare member variables here. Examples:
# var a = 2
export(String) var level
export(Array, Resource) var commonEnemies
export(Array, Resource) var eliteEnemies

# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
func _init(commonEnemies = [],eliteEnemies = [], level = ""):
	self.commonEnemies = commonEnemies
	self.eliteEnemies = eliteEnemies
	self.level = level

