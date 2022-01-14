extends Node2D
# TITLE : CreateBoard
# Functions : mirrorThis, _on_Node2D_setStuffs
# Purpose : To create the peg board using procedueral generation
# Closely Connected Scripts : Mirror, RandomPegZone


# Connected To : Mirror
# Purpose : Sends the pegs to be mirrored
signal mirrorThis(pegs)


var peg := load("res://resources/Pegs/Generic Peg/PEG.tscn") 


# Recieved From : RandomPegZone
# Purpose : Creates the First half of randomly generated pegs
func _on_Node2D_setStuffs(upperLeft : Node2D, upperRight : Node2D, _bottomLeft : Node2D, BottomRight : Node2D, minPeg : int, maxPeg : int) -> void:
	randomize()
	self.set_global_scale(Vector2(1,1))
	var numOfPegs := rand_range(minPeg, maxPeg)
	var pegs := []
	for n in numOfPegs:
		var maxX = upperRight.global_position.x
		var x := rand_range(upperLeft.global_position.x, maxX)
		var maxY = BottomRight.global_position.y 
		var y := rand_range(upperRight.global_position.y, maxY)
		var newPeg = peg.instance()
		self.add_child(newPeg)
		newPeg.global_position = Vector2(x,y)
		pegs.append(self.to_local(Vector2(x,y)))

	emit_signal("mirrorThis", pegs)
