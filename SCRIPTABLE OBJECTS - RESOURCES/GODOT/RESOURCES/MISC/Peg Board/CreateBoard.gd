extends Node2D
# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 


# connected To : 
# Purpose : 
signal mirrorThis(pegs)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var peg = load("res://resources/Pegs/Generic Peg/PEG.tscn") 




func _on_Node2D_setStuffs(upperLeft, upperRight, _bottomLeft, BottomRight, minPeg, maxPeg):
	randomize()
	self.set_global_scale(Vector2(1,1))
	var numOfPegs = rand_range(minPeg, maxPeg)
	var pegs = []
	for n in numOfPegs:
		var maxX = upperRight.global_position.x
		var x = rand_range(upperLeft.global_position.x, maxX)
		var maxY = BottomRight.global_position.y
		var y = rand_range(upperRight.global_position.y, maxY)
		var newPeg = peg.instance()
		self.add_child(newPeg)
		newPeg.global_position = Vector2(x,y)
		pegs.append(self.to_local(Vector2(x,y)))

	emit_signal("mirrorThis", pegs)
