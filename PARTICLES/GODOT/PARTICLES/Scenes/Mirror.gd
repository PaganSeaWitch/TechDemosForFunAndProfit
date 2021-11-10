extends Node2D

signal AttachPegs(pegs)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var peg = load("Scenes//Peg Scenes//PEG.tscn")


func _on_FirstHalf_mirrorThis(pegs):
	var scale = get_parent().get_scale()
	#self.set_scale(Vector2(1/scale.x, 1/scale.y))
	for n in range(pegs.size()):
		var newPeg = peg.instance()
		var oldScale = newPeg.get_scale()
		self.add_child(newPeg)
		newPeg.set_scale(Vector2(oldScale.x * 1/scale.x ,oldScale.y * 1/scale.y ))
		newPeg.position = Vector2(pegs[n].x * -1, pegs[n].y)


