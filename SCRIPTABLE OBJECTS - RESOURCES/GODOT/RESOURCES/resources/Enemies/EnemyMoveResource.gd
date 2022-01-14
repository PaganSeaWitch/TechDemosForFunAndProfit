extends Resource
class_name EnemeyMove

# TITLE : EnemyMoveResource
# Functions : _init
# Purpose : creates Enemy Moves
# Closely Connected Scripts : 


export(Array, PackedScene) var moveSet

# warning-ignore:shadowed_variable
# Purpose : init resource
func _init(moveSet := []):
	self.moveSet = moveSet
