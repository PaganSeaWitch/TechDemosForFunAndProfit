extends Node2D
# TITLE : Mirror
# Functions : _on_FirstHalf_mirrorThis
# Purpose : Mirrors recieved pegs
# Closely Connected Scripts : CreateBoard


var peg = load("res://resources/Pegs/Generic Peg/PEG.tscn")

# Recieved From : CreateBoard
# Purpose : Recieves array of pegs and mirrors them
func _on_FirstHalf_mirrorThis(pegs : Array):
	self.set_global_scale(Vector2(1,1))
	for n in range(pegs.size()):
		var newPeg = peg.instance()
		self.add_child(newPeg)
		newPeg.position = Vector2(pegs[n].x * -1, pegs[n].y)


