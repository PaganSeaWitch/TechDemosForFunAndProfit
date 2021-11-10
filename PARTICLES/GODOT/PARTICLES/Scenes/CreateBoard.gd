extends Node2D

signal mirrorThis(pegs)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var peg = load("Scenes//Peg Scenes//PEG.tscn") 




func _on_Node2D_setStuffs(upperLeft, upperRight, bottomLeft, BottomRight, minPeg, maxPeg):
	randomize()
	var scale = get_parent().get_scale()
	self.set_scale(Vector2(1/scale.x, 1/scale.y))
	var numOfPegs = rand_range(minPeg, maxPeg)
	var pegs = []
	for n in numOfPegs:
		var maxX = upperRight.global_position.x /2
		var x = rand_range(upperLeft.global_position.x, maxX)
		var maxY = BottomRight.global_position.y
		var y = rand_range(upperRight.global_position.y, maxY)
		var newPeg = peg.instance()
		self.add_child(newPeg)
		newPeg.global_position = Vector2(x,y)
		pegs.append(Vector2(x,y))
	emit_signal("mirrorThis", pegs)
