extends Area2D

# TITLE : tempArea
# Functions : _ready
# Purpose : to get the nodes of its children and send it to RandomPegZone
# Closely Connected Scripts : RandomPegZone


# Connected To : RandomPegZone
# Purpose : To give positions for creating pegs
signal givePos(upperleft, upperRight, bottomLeft, bottomRight)


# Called when the node enters the scene tree for the first time.
func _ready():
	var upperLeft = self.get_child(0)
	var upperRight = self.get_child(1)
	var bottomLeft = self.get_child(2)
	var bottomRight = self.get_child(3)
	emit_signal("givePos", upperLeft, upperRight, bottomLeft, bottomRight)
