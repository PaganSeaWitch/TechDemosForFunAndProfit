extends Node2D
# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var peg = load("res://resources/Pegs/Generic Peg/PEG.tscn")


func _on_FirstHalf_mirrorThis(pegs):
	self.set_global_scale(Vector2(1,1))
	for n in range(pegs.size()):
		var newPeg = peg.instance()
		self.add_child(newPeg)
		newPeg.position = Vector2(pegs[n].x * -1, pegs[n].y)


