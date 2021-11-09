extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var peg = load("Scenes//Peg Scenes//PEG.tscn") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FirstHalf_mirrorThis(pegs):
	for n in range(pegs.size()):
		var newPeg = peg.instance()
		newPeg.position.x = pegs[n].position.x * -1
		newPeg.position.y = pegs[n].position.y
		self.add_child(newPeg)
