extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var peg = load("Scenes//Peg Scenes//PEG.tscn") 
signal mirrorThis(pegs)
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var numOfPegs = rand_range(10, 20)
	var pegs = []
	for n in numOfPegs:
		var x = rand_range(0, get_viewport().get_visible_rect().size[0]/2)
		var y = rand_range(0, get_viewport().get_visible_rect().size[1])
		var newPeg = peg.instance();
		newPeg.position = Vector2(x,y)
		pegs.append(newPeg)
		self.add_child(newPeg)
	emit_signal("mirrorThis", pegs)
	


